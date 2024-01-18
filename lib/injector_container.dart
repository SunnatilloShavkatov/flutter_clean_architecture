// ignore_for_file: avoid_redundant_argument_values

import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart';

import 'constants/constants.dart';
import 'core/connectivity/network_info.dart';
import 'core/local_source/local_source.dart';
import 'features/auth/domain/repository/auth_repository.dart';
import 'features/auth/presentation/bloc/confirm/confirm_code_bloc.dart';
import 'features/auth/presentation/bloc/login/auth_bloc.dart';
import 'router/app_routes.dart';

final sl = GetIt.instance;
late Box<dynamic> _box;

Future<void> init() async {
  /// External
  await initHive();

  /// Dio
  sl.registerLazySingleton(
    () => Dio()
      ..options = BaseOptions(
        contentType: 'application/json',
        sendTimeout: const Duration(seconds: 30),
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Authorization': 'API-KEY',
          'X-API-KEY': Constants.apiKey,
          'Resource-Id': Constants.resourceId,
          'Environment-Id': Constants.environmentId,
        },
        queryParameters: {'project-id': Constants.projectId},
      )
      ..interceptors.add(
        LogInterceptor(
          request: kDebugMode,
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseHeader: kDebugMode,
          responseBody: kDebugMode,
          error: kDebugMode,
          logPrint: (object) {
            if (kDebugMode) {
              log('dio: $object');
            }
          },
        ),
      ),
  );

  sl<Dio>().interceptors.addAll(
    [
      chuck.getDioInterceptor(),
      RetryInterceptor(
        dio: sl<Dio>(),
        toNoInternetPageNavigator: () async {
          await rootNavigatorKey.currentContext!.pushNamed(
            Routes.noInternet,
          );
        },
        accessTokenGetter: () => 'Bearer ${localSource.accessToken}',
        refreshTokenFunction: () async {
          await localSource.clear().then(
            (value) {
              rootNavigatorKey.currentContext!.goNamed(Routes.initial);
            },
          );
        },
        logPrint: (message) {
          if (kDebugMode) {
            log('dio: $message');
          }
        },
      ),
    ],
  );

  /// Core
  sl
    ..registerSingleton<LocalSource>(LocalSource(_box))
    ..registerLazySingleton(
      () => InternetConnectionChecker.createInstance(
        checkInterval: const Duration(seconds: 3),
      ),
    )
    ..registerSingletonAsync<PackageInfo>(PackageInfo.fromPlatform)
    ..registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// features
  authFeature();
}

void authFeature() {
  /// use cases
  sl

    /// repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(dio: sl()))

    /// bloc
    ..registerFactory(() => AuthBloc(authRepository: sl()))
    ..registerFactory(() => ConfirmCodeBloc(sl()));
}

Future<void> initHive() async {
  const boxName = 'flutter_clean_architecture_box';
  final Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  _box = await Hive.openBox<dynamic>(boxName);
}

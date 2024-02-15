import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'app_options.dart';
import 'core/utils/utils.dart';
import 'core/widgets/native_splash/flutter_native_splash.dart';
import 'injector_container.dart' as di;
import 'router/app_routes.dart';
import 'services/notification_service.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await NotificationService.initialize();

  /// bloc logger
  if (kDebugMode) {
    Bloc.observer = LogBlocObserver();
  }
  await di.init();

  /// global CERTIFICATE_VERIFY_FAILEd_KEY
  HttpOverrides.global = _HttpOverrides();
  runApp(
    ModelBinding(
      initialModel: AppOptions(
        themeMode: ThemeMode.dark,
        // themeMode: localSource.themeMode,
        locale: Locale(localSource.locale),
      ),
      child: const App(),
    ),
  );
  FlutterNativeSplash.remove();
}

class _HttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) =>
      super.createHttpClient(context)
        ..badCertificateCallback = (cert, host, port) => true;
}

/// flutter pub run flutter_launcher_icons:main
/// flutter run -d windows
/// flutter build apk --release
/// flutter build apk --split-per-abi
/// flutter build appbundle --release
/// flutter pub run build_runner watch --delete-conflicting-outputs
/// flutter pub ipa
/// dart fix --apply

// ignore_for_file: avoid_dynamic_calls

part of "../../domain/repository/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, SendMessageResponse>> sendCode({
    required SendCodeRequest request,
  }) async {
    try {
      final Response<dynamic> response = await dio.post(
        Constants.baseUrl + Urls.sendCode,
        data: request.toJson(),
      );
      return Right<Failure, SendMessageResponse>(
        SendMessageResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, SendMessageResponse>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, SendMessageResponse>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }

  @override
  Future<Either<Failure, SendMessageResponse>> verifySmsCode({
    required VerifyRequest request,
  }) async {
    try {
      final Response<dynamic> response = await dio.post(
        "${Constants.baseUrl}${Urls.loginWithOption}",
        data: request.toJson(),
      );
      return Right<Failure, SendMessageResponse>(
        SendMessageResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, SendMessageResponse>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, SendMessageResponse>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }

  @override
  Future<Either<Failure, User>> getUserInfo({
    required String userId,
  }) async {
    try {
      final Response<dynamic> response = await dio.get(
        "${Constants.baseUrl}${Urls.objectSlim}${Slugs.patients}/$userId",
        data: <String, String>{},
      );
      final Map<String, dynamic> data = response.data;
      return Right<Failure, User>(
        User.fromJson(data["data"]?["data"]?["response"]),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, User>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, User>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  }) async {
    try {
      final Response<dynamic> response = await dio.post(
        Constants.baseUrl + Urls.register,
        data: request,
      );
      return Right<Failure, RegisterUserResponse>(
        RegisterUserResponse.fromJson(response.data),
      );
    } on DioException catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, RegisterUserResponse>(
        ServerError.withDioError(error: error).failure,
      );
    } on Exception catch (error, stacktrace) {
      log("Exception occurred: $error stacktrace: $stacktrace");
      return Left<Failure, RegisterUserResponse>(
        ServerError.withError(message: error.toString()).failure,
      );
    }
  }
}

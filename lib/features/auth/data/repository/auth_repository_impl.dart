part of '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.dio,
  });

  final Dio dio;

  @override
  Future<Either<Failure, SendMessageResponse>> sendCode({
    required SendCodeRequest request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + Urls.sendCode,
        data: request.toJson(),
      );
      return Right(SendMessageResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, SendMessageResponse>> verifySmsCode({
    required VerifyRequest request,
  }) async {
    try {
      final Response response = await dio.post(
        '${Constants.authUrl}${Urls.loginWithOption}',
        data: request.toJson(),
      );
      return Right(SendMessageResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, User>> getUserInfo({
    required String userId,
  }) async {
    try {
      final Response response = await dio.get(
        '${Constants.baseUrl}${Urls.objectSlim}${Slugs.patients}/$userId',
        data: {},
      );
      final Map<String, dynamic> data = response.data;
      return Right(User.fromJson(data['data']?['data']?['response']));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }

  @override
  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  }) async {
    try {
      final Response response = await dio.post(
        Constants.authUrl + Urls.register,
        data: request,
      );
      return Right(RegisterUserResponse.fromJson(response.data));
    } on DioException catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withDioError(error: error).failure);
    } on Exception catch (error, stacktrace) {
      log('Exception occurred: $error stacktrace: $stacktrace');
      return Left(ServerError.withError(message: error.toString()).failure);
    }
  }
}

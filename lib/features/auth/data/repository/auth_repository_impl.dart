part of '../../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.authLocalDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, SignInResponseEntity>> signIn(
    SignInRequestEntity requestEntity,
  ) async {
    final request = SignInRequestModel(
      email: requestEntity.email,
      password: requestEntity.password,
    );
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.signIn(request);
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, SignUpResponseEntity>> signUp(
    SignUpRequestEntity requestEntity,
  ) async {
    final signUpRequestModel = SignUpRequestModel(
      firstName: requestEntity.firstName,
      lastName: requestEntity.lastName,
      email: requestEntity.email,
      password: requestEntity.password,
      language: requestEntity.language,
    );
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.signUp(signUpRequestModel);
        return Right(response.toEntity());
      } on Exception catch (e) {
        return Left(ServerFailure(message: e.toString()));
      }
    } else {
      return const Left(NoInternetFailure(message: 'No Internet Connection'));
    }
  }
}

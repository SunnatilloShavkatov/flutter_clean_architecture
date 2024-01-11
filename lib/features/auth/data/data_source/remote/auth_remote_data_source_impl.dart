part of 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<SignInResponseModel> signIn(
    SignInRequestModel signInRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.signInUrl,
        data: jsonEncode(signInRequestModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignInResponseModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }

  @override
  Future<SignUpResponseModel> signUp(
    SignUpRequestModel signUpRequestModel,
  ) async {
    try {
      final Response response = await dio.post(
        Constants.baseUrl + Urls.signUpUrl,
        data: jsonEncode(signUpRequestModel.toJson()),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return SignUpResponseModel.fromJson(response.data);
      } else {
        throw ServerException.fromJson(response.data);
      }
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    } on FormatException {
      throw const ServerException(message: Validations.somethingWentWrong);
    }
  }
}

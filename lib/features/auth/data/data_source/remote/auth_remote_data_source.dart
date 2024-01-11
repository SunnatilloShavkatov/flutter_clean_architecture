import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../constants/constants.dart';
import '../../../../../core/error/exceptions.dart';
import '../../models/sign_in/sign_in_request_model.dart';
import '../../models/sign_in/sign_in_response_model.dart';
import '../../models/sign_up/Sign_up_request_model.dart';
import '../../models/sign_up/sign_up_response_model.dart';

part 'auth_remote_data_source_impl.dart';

abstract class AuthRemoteDataSource {
  Future<SignInResponseModel> signIn(SignInRequestModel signInRequestModel);

  Future<SignUpResponseModel> signUp(SignUpRequestModel signUpRequestModel);
}

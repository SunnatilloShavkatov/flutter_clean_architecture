import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../../constants/constants.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_error.dart';
import '../../data/models/confirm/verify_request.dart';
import '../../data/models/register/register_user_response.dart';
import '../../data/models/send_message_request.dart';
import '../../data/models/send_message_response.dart';

part '../../data/repository/auth_repository_impl.dart';

sealed class AuthRepository {
  Future<Either<Failure, SendMessageResponse>> sendCode({
    required SendCodeRequest request,
  });

  Future<Either<Failure, SendMessageResponse>> verifySmsCode({
    required VerifyRequest request,
  });

  Future<Either<Failure, RegisterUserResponse>> registerUser({
    required Map<String, dynamic> request,
  });

  Future<Either<Failure, User>> getUserInfo({required String userId});
}

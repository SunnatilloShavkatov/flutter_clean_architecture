import "dart:developer";

import "package:dio/dio.dart";

import "package:flutter_clean_architecture/constants/constants.dart";
import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";
import "package:flutter_clean_architecture/core/error/server_error.dart";
import "package:flutter_clean_architecture/features/auth/data/models/confirm/verify_request.dart";
import "package:flutter_clean_architecture/features/auth/data/models/register/register_user_response.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_request.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_response.dart";

part "../../data/repository/auth_repository_impl.dart";

abstract class AuthRepository {
  const AuthRepository();

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

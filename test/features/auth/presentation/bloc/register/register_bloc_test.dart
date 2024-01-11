import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_architecture/constants/constants.dart';
import 'package:flutter_clean_architecture/core/either/either.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';
import 'package:flutter_clean_architecture/features/auth/data/models/sign_up/sign_up_response_model.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/sign_up/sign_up_request_entity.dart';
import 'package:flutter_clean_architecture/features/auth/domain/entities/sign_up/sign_up_response_entity.dart';
import 'package:flutter_clean_architecture/features/auth/domain/usecases/sign_up.dart';
import 'package:flutter_clean_architecture/features/auth/presentation/bloc/register_bloc/register_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'register_bloc_test.mocks.dart';

@GenerateMocks([SignUp])
void main() {
  late SignUp signUp;
  late RegisterBloc registerBloc;

  setUp(() {
    signUp = MockSignUp();
    registerBloc = RegisterBloc(
      signUp: signUp,
    );
  });

  group('sign up validation', () {
    blocTest<RegisterBloc, RegisterState>(
      'first name empty',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = '';
        const lastName = 'Otajonov';
        const email = 'azimdjan18@gmail.com';
        const password = 'a3213354';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.firstnameEmpty,
          errors: RegisterInputErrors.firstName,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'last name empty',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = '';
        const email = 'azimdjan18@gmail.com';
        const password = 'a3213354';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.lastnameEmpty,
          errors: RegisterInputErrors.lastName,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'email empty',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = '';
        const password = 'a3213354';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.emailEmpty,
          errors: RegisterInputErrors.email,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'not email',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = 'azimdjan18gmail.com';
        const password = 'a3213354';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.notEmail,
          errors: RegisterInputErrors.email,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'password empty',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = 'azimdjan18@gmail.com';
        const password = '';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.passwordEmpty,
          errors: RegisterInputErrors.password,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'password not same',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = 'azimdjan18@gmail.com';
        const password = 'a3213354';
        const confirmPassword = 'a321335';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.passwordNotMatch,
          errors: RegisterInputErrors.confirmPassword,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'password too short',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = 'azimdjan18@gmail.com';
        const password = 'a32133';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.passwordShort,
          errors: RegisterInputErrors.password,
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'password too long',
      build: () => registerBloc,
      act: (bloc) {
        const firstName = 'Azim';
        const lastName = 'Otajonov';
        const email = 'azimdjan18@gmail.com';
        const password = 'a3213354fjdsknfjkdsanfjfdsfsffda';
        const confirmPassword = 'a3213354';
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: Validations.passwordLong,
          errors: RegisterInputErrors.password,
        ),
      ],
    );
  });

  group('sign up api test', () {
    const firstName = 'Azim';
    const lastName = 'Otajonov';
    const email = 'azimdjan18@gmail.com';
    const password = 'a3213354';
    const confirmPassword = 'a3213354';
    late SignUpResponseEntity signUpResponseEntity;

    setUp(() {
      signUpResponseEntity = SignUpResponseModel.fromJson(
        jsonDecode(
          fixture('sign_up_response_fixture'),
        ),
      ).toEntity();
    });

    blocTest<RegisterBloc, RegisterState>(
      'sign up server error',
      build: () {
        when(
          signUp(
            const Params(
              SignUpRequestEntity(
                language: 'en',
                firstName: firstName,
                lastName: lastName,
                email: email,
                password: password,
              ),
            ),
          ),
        ).thenAnswer(
          (realInvocation) async => const Left(
            ServerFailure(message: 'Something went wrong'),
          ),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(
          status: RegisterStatus.error,
          message: 'Something went wrong',
        ),
      ],
    );

    blocTest<RegisterBloc, RegisterState>(
      'sign up successful',
      build: () {
        when(
          signUp(
            const Params(
              SignUpRequestEntity(
                language: 'en',
                firstName: firstName,
                lastName: lastName,
                email: email,
                password: password,
              ),
            ),
          ),
        ).thenAnswer(
          (realInvocation) async => Right(
            signUpResponseEntity,
          ),
        );
        return registerBloc;
      },
      act: (bloc) {
        bloc.add(
          const RegisterButtonPressed(
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            confirmPassword: confirmPassword,
          ),
        );
      },
      expect: () => <RegisterState>[
        const RegisterState(status: RegisterStatus.loading),
        const RegisterState(status: RegisterStatus.success),
      ],
    );
  });
}
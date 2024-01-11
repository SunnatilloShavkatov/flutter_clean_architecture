part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();
}

class LoginPhoneNumberState extends LoginState {
  const LoginPhoneNumberState({
    this.phoneNumber = '',
    this.status = LoginStatus.initial,
  });

  final String phoneNumber;
  final LoginStatus status;

  LoginPhoneNumberState copyWith({
    String? phoneNumber,
    LoginStatus? status,
  }) =>
      LoginPhoneNumberState(
        phoneNumber: phoneNumber ?? this.phoneNumber,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [phoneNumber, status];
}

class LoginCodeState extends LoginState {
  const LoginCodeState({this.code = '', this.status = LoginStatus.initial});

  final String code;
  final LoginStatus status;

  LoginCodeState copyWith({
    String? code,
    LoginStatus? status,
  }) =>
      LoginCodeState(
        code: code ?? this.code,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [code, status];
}

enum LoginStatus { initial, loading, success, error }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isError => this == LoginStatus.error;
}

part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEnterPhoneNumberEvent extends AuthEvent {
  const LoginEnterPhoneNumberEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginPhoneButtonPressedEvent extends AuthEvent {
  const LoginPhoneButtonPressedEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginEnterCodeEvent extends AuthEvent {
  const LoginEnterCodeEvent({required this.code});

  final String code;

  @override
  List<Object?> get props => [code];
}

class LoginCodeButtonPressedEvent extends AuthEvent {
  const LoginCodeButtonPressedEvent({required this.code});

  final String code;

  @override
  List<Object?> get props => [code];
}

part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEnterPhoneNumberEvent extends LoginEvent {
  const LoginEnterPhoneNumberEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginPhoneButtonPressedEvent extends LoginEvent {
  const LoginPhoneButtonPressedEvent({required this.phoneNumber});

  final String phoneNumber;

  @override
  List<Object?> get props => [phoneNumber];
}

class LoginEnterCodeEvent extends LoginEvent {
  const LoginEnterCodeEvent({required this.code});

  final String code;

  @override
  List<Object?> get props => [code];
}

class LoginCodeButtonPressedEvent extends LoginEvent {
  const LoginCodeButtonPressedEvent({required this.code});

  final String code;

  @override
  List<Object?> get props => [code];
}

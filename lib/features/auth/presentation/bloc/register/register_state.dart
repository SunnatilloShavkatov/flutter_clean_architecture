part of "register_bloc.dart";

enum RegisterStatus { initial, loading, error, success }

class RegisterState extends Equatable {
  const RegisterState({required this.status, this.message, this.errors});

  final String? message;
  final RegisterInputErrors? errors;
  final RegisterStatus status;

  @override
  List<Object?> get props => <Object?>[status, message, errors];

  RegisterState copyWith({
    RegisterStatus? status,
    String? message,
    RegisterInputErrors? errors,
  }) =>
      RegisterState(
        status: status ?? this.status,
        message: message ?? this.message,
        errors: errors ?? this.errors,
      );
}

enum RegisterInputErrors {
  firstName,
  lastName,
  email,
  password,
  confirmPassword
}

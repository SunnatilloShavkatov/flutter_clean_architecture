part of "register_bloc.dart";

sealed class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterButtonPressed extends RegisterEvent {
  const RegisterButtonPressed({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;

  @override
  List<Object?> get props => <Object?>[
        firstName,
        lastName,
        email,
        password,
        confirmPassword,
      ];
}

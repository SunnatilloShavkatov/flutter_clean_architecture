import "package:equatable/equatable.dart";

class SignInRequestEntity extends Equatable {
  const SignInRequestEntity({
    required this.email,
    required this.password,
  });

  final String? email;
  final String? password;

  @override
  List<Object?> get props => <Object?>[
        email,
        password,
      ];
}

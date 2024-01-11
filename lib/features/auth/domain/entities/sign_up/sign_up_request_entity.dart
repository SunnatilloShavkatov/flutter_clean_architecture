import 'package:equatable/equatable.dart';

class SignUpRequestEntity extends Equatable {
  const SignUpRequestEntity({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.language,
  });

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final String? language;

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        password,
      ];
}

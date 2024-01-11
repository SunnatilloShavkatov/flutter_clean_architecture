import 'package:equatable/equatable.dart';

class SignInResponseEntity extends Equatable {
  const SignInResponseEntity({
    required this.token,
    required this.firstName,
    required this.lastName,
  });

  final String? token;
  final String? firstName;
  final String? lastName;

  @override
  List<Object?> get props => [
        token,
        firstName,
        lastName,
      ];
}

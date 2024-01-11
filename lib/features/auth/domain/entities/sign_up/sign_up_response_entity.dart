import 'package:equatable/equatable.dart';

class SignUpResponseEntity extends Equatable {
  const SignUpResponseEntity({required this.token});

  final String? token;

  @override
  List<Object?> get props => [token];
}

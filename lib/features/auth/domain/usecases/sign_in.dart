import 'package:equatable/equatable.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/sign_in/sign_in_request_entity.dart';
import '../entities/sign_in/sign_in_response_entity.dart';
import '../repository/auth_repository.dart';

class SignIn implements UseCase<SignInResponseEntity, Params> {
  SignIn(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, SignInResponseEntity>> call(Params params) async {
    final response = await authRepository.signIn(params.signInRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  const Params({required this.signInRequestEntity});

  final SignInRequestEntity signInRequestEntity;

  @override
  List<Object?> get props => [signInRequestEntity];
}

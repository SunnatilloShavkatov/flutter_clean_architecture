import 'package:equatable/equatable.dart';
import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/sign_up/sign_up_request_entity.dart';
import '../entities/sign_up/sign_up_response_entity.dart';
import '../repository/auth_repository.dart';

class SignUp implements UseCase<SignUpResponseEntity, Params> {
  SignUp(this.authRepository);

  final AuthRepository authRepository;

  @override
  Future<Either<Failure, SignUpResponseEntity>> call(Params params) async {
    final response = await authRepository.signUp(params.signUpRequestEntity);
    return response;
  }
}

class Params extends Equatable {
  const Params(this.signUpRequestEntity);

  final SignUpRequestEntity signUpRequestEntity;

  @override
  List<Object?> get props => [signUpRequestEntity];
}

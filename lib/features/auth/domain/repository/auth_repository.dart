import '../../../../core/either/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../data/data_source/local/auth_local_data_source.dart';
import '../../data/data_source/remote/auth_remote_data_source.dart';
import '../../data/models/sign_in/sign_in_request_model.dart';
import '../../data/models/sign_in/sign_in_response_model.dart';
import '../../data/models/sign_up/Sign_up_request_model.dart';
import '../../data/models/sign_up/sign_up_response_model.dart';
import '../entities/sign_in/sign_in_request_entity.dart';
import '../entities/sign_in/sign_in_response_entity.dart';
import '../entities/sign_up/sign_up_request_entity.dart';
import '../entities/sign_up/sign_up_response_entity.dart';

part '../../data/repository/auth_repository_impl.dart';

sealed class AuthRepository {
  Future<Either<Failure, SignUpResponseEntity>> signUp(
    SignUpRequestEntity requestEntity,
  );

  Future<Either<Failure, SignInResponseEntity>> signIn(
    SignInRequestEntity requestEntity,
  );
}

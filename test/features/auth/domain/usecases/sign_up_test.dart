import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/features/auth/domain/entities/sign_up/sign_up_request_entity.dart";
import "package:flutter_clean_architecture/features/auth/domain/entities/sign_up/sign_up_response_entity.dart";
import "package:flutter_clean_architecture/features/auth/domain/usecases/sign_up.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";

import "sign_in_test.mocks.dart";

void main() {
  late SignUp useCase;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    useCase = SignUp(mockAuthRepository);
  });

  const SignUpRequestEntity signUpRequest = SignUpRequestEntity(
    firstName: "firstName",
    lastName: "lastName",
    email: "email",
    password: "password",
    language: "uz",
  );
  const SignUpResponseEntity signUpResponse = SignUpResponseEntity(
    token: "token",
  );

  test("should sign up for given request for repository", () async {
    when(mockAuthRepository.signUp(signUpRequest)).thenAnswer(
      (Invocation realInvocation) async => const Right(signUpResponse),
    );

    final result = await useCase(const Params(signUpRequest));

    expect(result, const Right(signUpResponse));

    verify(mockAuthRepository.signUp(signUpRequest));

    verifyNoMoreInteractions(mockAuthRepository);
  });
}

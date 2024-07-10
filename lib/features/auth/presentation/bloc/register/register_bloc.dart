import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";

import "package:flutter_clean_architecture/core/mixins/cache_mixin.dart";

part "register_event.dart";

part "register_state.dart";

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> with CacheMixin {
  RegisterBloc()
      : super(const RegisterState(status: RegisterStatus.initial)) {
    on<RegisterButtonPressed>(_registerButtonPressedHandler);
  }


  Future<void> _registerButtonPressedHandler(
    RegisterButtonPressed event,
    Emitter<RegisterState> emit,
  ) async {
    emit(const RegisterState(status: RegisterStatus.loading));
    // const SignUpRequestEntity request = SignUpRequestEntity(
    //   firstName: "firstName.value",
    //   lastName: "lastName.value",
    //   email: "email.value",
    //   password: "password.value",
    //   language: "en",
    // );
    // final response = await signUp(const Params(request));
    // response.fold(
    //   (error) => emit(
    //     RegisterState(
    //       status: RegisterStatus.error,
    //       message: (error is ServerFailure)
    //           ? error.message
    //           : Validations.internetFailure,
    //     ),
    //   ),
    //   (response) {
    //     emit(
    //       const RegisterState(status: RegisterStatus.success),
    //     );
    //   },
    // );
  }
}

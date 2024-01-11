import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/mixins/cache_mixin.dart';

import '../../../domain/usecases/sign_in.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with CacheMixin {
  LoginBloc({required this.signIn}) : super(const LoginPhoneNumberState()) {
    on<LoginEnterPhoneNumberEvent>(_enterPhoneNumberHandler);
    on<LoginPhoneButtonPressedEvent>(_phoneNumberPressedHandler);
    on<LoginEnterCodeEvent>(_enterCodeHandler);
    on<LoginCodeButtonPressedEvent>(_codePressedHandler);
  }

  final SignIn signIn;

  void _enterPhoneNumberHandler(
    LoginEnterPhoneNumberEvent event,
    Emitter<LoginState> emit,
  ) {
    final newState = state as LoginPhoneNumberState;
    emit(
      newState.copyWith(phoneNumber: event.phoneNumber),
    );
  }

  void _phoneNumberPressedHandler(
    LoginPhoneButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      const LoginCodeState(),
    );
  }

  void _enterCodeHandler(
    LoginEnterCodeEvent event,
    Emitter<LoginState> emit,
  ) {}

  void _codePressedHandler(
    LoginCodeButtonPressedEvent event,
    Emitter<LoginState> emit,
  ) {}
}

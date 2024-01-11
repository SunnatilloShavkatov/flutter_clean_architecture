import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/mixins/cache_mixin.dart';

import '../../../data/models/send_message_request.dart';
import '../../../domain/repository/auth_repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with CacheMixin {
  AuthBloc({
    required this.authRepository,
  }) : super(const AuthInitial()) {
    on<LoginEnterPhoneNumberEvent>(_enterPhoneNumberHandler);
    on<LoginPhoneButtonPressedEvent>(_phoneNumberPressedHandler);
    on<LoginEnterCodeEvent>(_enterCodeHandler);
    on<LoginCodeButtonPressedEvent>(_codePressedHandler);
  }

  final AuthRepository authRepository;

  void _enterPhoneNumberHandler(
    LoginEnterPhoneNumberEvent event,
    Emitter<AuthState> emit,
  ) {}

  Future<void> _phoneNumberPressedHandler(
    LoginPhoneButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoadingState());
    final result = await authRepository.sendCode(
      request: SendCodeRequest(
        text: 'code',
        recipient: "+998${event.phoneNumber.replaceAll(" ", "")}",
        registerType: 'PHONE',
      ),
    );
    result.fold(
      (left) {
        emit(const AuthFailure(message: 'Error occured! Try again later!'));
      },
      (right) {
        emit(
          AuthSuccessState(
            smsId: right.data?['sms_id'] as String? ?? '',
            phone: "+998${event.phoneNumber.replaceAll(" ", "")}",
            uiPhone: event.phoneNumber,
            data: right.data?['data'] is Map ? right.data!['data'] : {},
          ),
        );
      },
    );
  }

  void _enterCodeHandler(
    LoginEnterCodeEvent event,
    Emitter<AuthState> emit,
  ) {}

  void _codePressedHandler(
    LoginCodeButtonPressedEvent event,
    Emitter<AuthState> emit,
  ) {}
}

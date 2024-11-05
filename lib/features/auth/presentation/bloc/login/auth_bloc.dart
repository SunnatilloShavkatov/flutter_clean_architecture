import "package:bloc_concurrency/bloc_concurrency.dart";
import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";
import "package:flutter_clean_architecture/core/mixins/cache_mixin.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_request.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_response.dart";
import "package:flutter_clean_architecture/features/auth/domain/repository/auth_repository.dart";

part "auth_event.dart";

part "auth_state.dart";

class AuthBloc extends Bloc<AuthEvent, AuthState> with CacheMixin {
  AuthBloc({
    required this.authRepository,
  }) : super(const AuthInitial()) {
    on<LoginEnterPhoneNumberEvent>(
      _enterPhoneNumberHandler,
      transformer: restartable(),
    );
    on<LoginPhoneButtonPressedEvent>(
      _phoneNumberPressedHandler,
      transformer: restartable(),
    );
    on<LoginEnterCodeEvent>(
      _enterCodeHandler,
      transformer: restartable(),
    );
    on<LoginCodeButtonPressedEvent>(
      _codePressedHandler,
      transformer: restartable(),
    );
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
    final Either<Failure, SendMessageResponse> result =
        await authRepository.sendCode(
      request: SendCodeRequest(
        text: "code",
        recipient: "+998${event.phoneNumber.replaceAll(" ", "")}",
        registerType: "PHONE",
      ),
    );
    result.fold(
      (Failure left) {
        emit(const AuthFailure(message: "Error occured! Try again later!"));
      },
      (SendMessageResponse right) {
        emit(
          AuthSuccessState(
            smsId: right.data?["sms_id"] as String? ?? "",
            phone: "+998${event.phoneNumber.replaceAll(" ", "")}",
            uiPhone: event.phoneNumber,
            data: right.data?["data"] is Map
                ? right.data!["data"]
                : <String, String>{},
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

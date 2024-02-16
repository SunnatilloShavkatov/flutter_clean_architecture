import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_clean_architecture/core/either/either.dart";
import "package:flutter_clean_architecture/core/error/failure.dart";
import "package:flutter_clean_architecture/core/mixins/cache_mixin.dart";
import "package:flutter_clean_architecture/features/auth/data/models/confirm/verify_request.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_request.dart";
import "package:flutter_clean_architecture/features/auth/data/models/send_message_response.dart";
import "package:flutter_clean_architecture/features/auth/domain/repository/auth_repository.dart";

part "confirm_code_event.dart";
part "confirm_code_state.dart";

class ConfirmCodeBloc extends Bloc<ConfirmCodeEvent, ConfirmCodeState>
    with CacheMixin {
  ConfirmCodeBloc(this.authRepository) : super(const ConfirmCodeState()) {
    on<ConfirmCodeCheckMessageEvent>(_onConfirmCode);
    on<ConfirmCodeEventInitial>(_onInitial);
    on<ConfirmCodeSendAgainEvent>(_sendAgain);
    on<CreatePatientOrderAfterNamedEvent>(_createPatientOrderNamedAfter);
  }

  final AuthRepository authRepository;

  void _onInitial(
      ConfirmCodeEventInitial event, Emitter<ConfirmCodeState> emit,) {
    if (state.confirmCodeStatus.isError) {
      emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.initial));
    }
  }

  Future<void> _onConfirmCode(
    ConfirmCodeCheckMessageEvent event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.loading));

    // final result = await authRepository.verifySmsCode(
    //   request: VerifyRequest(
    //     loginStrategy: 'PHONE_OTP',
    //     verifyData: event.data,
    //     tables: [],
    //   ),
    // );
    // await result.fold(
    //   (l) {
    //     if ((l as ServerFailure).message == 'Not Found') {
    //       emit(
    //         state.copyWith(
    //           isUserFound: false,
    //           confirmCodeStatus: ConfirmCodeStatus.confirmed,
    //         ),
    //       );
    //     } else if (l.message == 'Server error') {
    //       emit(
    //         state.copyWith(
    //           confirmCodeStatus: ConfirmCodeStatus.error,
    //           errorMessage: 'Неверный код',
    //         ),
    //       );
    //     } else {
    //       emit(
    //         state.copyWith(
    //           confirmCodeStatus: ConfirmCodeStatus.error,
    //           errorMessage: l.message,
    //         ),
    //       );
    //     }
    //   },
    //   (r) async {
    //     // final userResult = await authRepository.getUserInfo(
    //     //   userId: r.data?['user_id'] ?? '',
    //     // );
    //     // await userResult.fold(
    //     //   (left) {
    //     //     emit(
    //     //       state.copyWith(
    //     //         confirmCodeStatus: ConfirmCodeStatus.error,
    //     //         errorMessage: (left as ServerFailure).message,
    //     //       ),
    //     //     );
    //     //   },
    //     //   (right) async {
    //     //     // await setUserInfo(
    //     //     //   name: right.name ?? '',
    //     //     //   surName: right.surname ?? '',
    //     //     //   fatherName: right.patronymic ?? '',
    //     //     //   id: r.data?['user_id'] ?? '',
    //     //     //   phoneNumber: right.phone ?? '',
    //     //     //   accessToken: r.data?['token']['access_token'] as String? ?? '',
    //     //     //   refreshToken: r.data?['token']['refresh_token'] as String? ?? '',
    //     //     //   imageUrl: right.photo ?? '',
    //     //     // );
    //     //     emit(state.copyWith(confirmCodeStatus: ConfirmCodeStatus.success));
    //     //     add(
    //     //       CreatePatientOrderAfterNamedEvent(
    //     //         name: right.name ?? '',
    //     //         surname: right.surname ?? '',
    //     //       ),
    //     //     );
    //     //   },
    //     // );
    //     // emit(
    //     //   state.copyWith(
    //     //     isUserFound: r.message != 'Пользователь проверен, но не найден',
    //     //     confirmCodeStatus: ConfirmCodeStatus.confirmed,
    //     //   ),
    //     // );
    //   },
    // );
  }

  Future<void> _sendAgain(
    ConfirmCodeSendAgainEvent event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    final Either<Failure, SendMessageResponse> result = await authRepository.sendCode(
      request: SendCodeRequest(
        recipient: event.value,
        text: "code",
        registerType: "PHONE",
      ),
    );
    result.fold(
      (Failure l) {
        emit(state.copyWith(
          confirmCodeStatus: ConfirmCodeStatus.error,
          errorMessage: (l as ServerFailure).message,
        ),);
      },
      (SendMessageResponse r) {
        emit(
          state.copyWith(
            smsId: r.data?["sms_id"],
            confirmCodeStatus: ConfirmCodeStatus.success,
            isReverseSendCode: true,
          ),
        );
      },
    );
  }

  Future<void> _createPatientOrderNamedAfter(
    CreatePatientOrderAfterNamedEvent event,
    Emitter<ConfirmCodeState> emit,
  ) async {
    final String name = event.name;
    final String surname = event.surname;
    // await authRepository.createPatientOrderNamedAfter(
    //   request: OrderNamedAfterRequest(
    //     patientsId: localSource.userId,
    //     name: name,
    //     surname: surname,
    //     fatherName: '',
    //     birthday: '',
    //     gender: '',
    //     title: '$name$surname${localSource.userId}',
    //   ),
    // );
  }
}

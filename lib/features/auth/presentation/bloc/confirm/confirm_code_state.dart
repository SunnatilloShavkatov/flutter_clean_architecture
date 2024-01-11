part of 'confirm_code_bloc.dart';

class ConfirmCodeState extends Equatable {
  const ConfirmCodeState({
    this.isUserFound = false,
    this.isReverseSendCode = false,
    this.confirmCodeStatus = ConfirmCodeStatus.initial,
    this.smsId = '',
    this.errorMessage = '',
  });

  final bool isUserFound;
  final bool isReverseSendCode;
  final ConfirmCodeStatus confirmCodeStatus;
  final String smsId;
  final String errorMessage;

  @override
  List<Object?> get props => [
        isReverseSendCode,
        isUserFound,
        confirmCodeStatus,
        smsId,
        errorMessage,
      ];

  ConfirmCodeState copyWith({
    bool? isReverseSendCode,
    bool? isUserFound,
    ConfirmCodeStatus? confirmCodeStatus,
    String? smsId,
    String? errorMessage,
  }) =>
      ConfirmCodeState(
        isReverseSendCode: isReverseSendCode ?? this.isReverseSendCode,
        isUserFound: isUserFound ?? this.isUserFound,
        confirmCodeStatus: confirmCodeStatus ?? this.confirmCodeStatus,
        smsId: smsId ?? this.smsId,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

enum ConfirmCodeStatus { initial, loading, success, error, confirmed }

extension ConfirmCodeStatusX on ConfirmCodeStatus {
  bool get isInitial => this == ConfirmCodeStatus.initial;

  bool get isSuccess => this == ConfirmCodeStatus.success;

  bool get isError => this == ConfirmCodeStatus.error;

  bool get isLoading => this == ConfirmCodeStatus.loading;

  bool get isConfirmed => this == ConfirmCodeStatus.confirmed;
}

part of 'confirm_code_bloc.dart';

abstract class ConfirmCodeEvent extends Equatable {
  const ConfirmCodeEvent();
}

class ConfirmCodeEventInitial extends ConfirmCodeEvent {
  const ConfirmCodeEventInitial();

  @override
  List<Object?> get props => [];
}

class ConfirmCodePhoneChangeEvent extends ConfirmCodeEvent {
  const ConfirmCodePhoneChangeEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class ConfirmCodeCheckMessageEvent extends ConfirmCodeEvent {
  const ConfirmCodeCheckMessageEvent({
    required this.data,
  });

  final VerifyRequestData data;

  @override
  List<Object?> get props => [data];
}

class ConfirmCodeSendAgainEvent extends ConfirmCodeEvent {
  const ConfirmCodeSendAgainEvent(this.value);

  final String value;

  @override
  List<Object?> get props => [value];
}

class CreatePatientOrderAfterNamedEvent extends ConfirmCodeEvent {
  const CreatePatientOrderAfterNamedEvent({
    required this.name,
    required this.surname,
  });

  final String name;
  final String surname;

  @override
  List<Object?> get props => [name, surname];
}

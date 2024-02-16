part of "auth_bloc.dart";

sealed class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();

  @override
  List<Object?> get props => <Object?>[];
}

class AuthLoadingState extends AuthState {
  const AuthLoadingState();

  @override
  List<Object?> get props => <Object?>[];
}

class AuthSuccessState extends AuthState {
  const AuthSuccessState({
    required this.smsId,
    required this.phone,
    required this.uiPhone,
    required this.data,
  });

  final String smsId;
  final String phone;
  final String uiPhone;
  final Map<String, dynamic> data;

  @override
  List<Object?> get props => <Object?>[smsId, phone, uiPhone, data];
}

class AuthFailure extends AuthState {
  const AuthFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => <Object?>[message];
}

enum LoginStatus { initial, loading, success, error }

extension LoginStatusX on LoginStatus {
  bool get isInitial => this == LoginStatus.initial;

  bool get isLoading => this == LoginStatus.loading;

  bool get isSuccess => this == LoginStatus.success;

  bool get isError => this == LoginStatus.error;
}

part of 'auth_bloc.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  AuthSuccess({required this.user});
}

class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

class SignUpInitial extends AuthInitial {}

class SignUpLoading extends AuthLoading {}

class SignUpSuccess extends AuthSuccess {
  SignUpSuccess({required super.user});
}

class SignUpFailure extends AuthFailure {
  SignUpFailure({required super.error});
}

class SignOutLoading extends AuthLoading {}

class SignOutSuccess extends AuthState {}

class SignOutFailure extends AuthFailure {
  SignOutFailure({required super.error});
}

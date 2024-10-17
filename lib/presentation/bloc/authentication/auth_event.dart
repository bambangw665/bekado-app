part of 'auth_bloc.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String email;
  final String password;
  final String profilePic;
  final String name;
  final String phone;

  SignUpEvent(
      {required this.email,
      required this.password,
      required this.profilePic,
      required this.name,
      required this.phone});

  @override
  List<Object?> get props => [email, password, profilePic, name, phone];
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SignOutEvent extends AuthEvent {}

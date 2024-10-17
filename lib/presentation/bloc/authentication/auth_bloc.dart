import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/user_model.dart';
import '../../../domain/usecases/sign_in.dart';
import '../../../domain/usecases/sign_out.dart';
import '../../../domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUp signUp;
  final SignIn signIn;
  final SignOut signOut;

  AuthBloc({required this.signIn, required this.signOut, required this.signUp})
      : super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<SignOutEvent>(_onSignOut);
  }

  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignUpLoading());
    final result = await signUp(
      event.email,
      event.password,
      event.profilePic,
      event.name,
      event.phone,
    );
    result.fold(
      (failure) => emit(SignUpFailure(error: failure.message)),
      (user) => emit(SignUpSuccess(user: user)),
    );
  }

  Future<void> _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await signIn(event.email, event.password);
    result.fold(
      (failure) => emit(AuthFailure(error: failure.message)),
      (user) => emit(AuthSuccess(user: user)),
    );
  }

  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(SignOutLoading());
    final result = await signOut();
    result.fold(
      (failure) => emit(SignOutFailure(error: failure.message)),
      (user) => emit(SignOutSuccess()),
    );
  }
}

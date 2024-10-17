import 'package:bekado/core/errors/failures.dart';
import 'package:bekado/data/models/user_model.dart';
import 'package:bekado/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final AuthRepository repository;

  SignIn(this.repository);

  Future<Either<Failure, UserModel>> call(String email, String password) async {
    return await repository.signInWithEmailAndPassword(email, password);
  }
}

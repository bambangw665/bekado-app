import 'package:bekado/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:bekado/core/errors/failures.dart';
import 'package:bekado/domain/repositories/auth_repository.dart';

class SignUp {
  final AuthRepository repository;

  SignUp(this.repository);

  Future<Either<Failure, UserModel>> call(String email, String password,
      String profilePic, String name, String phone) async {
    return await repository.registerWithEmailAndPassword(
        email, password, profilePic, name, phone);
  }
}

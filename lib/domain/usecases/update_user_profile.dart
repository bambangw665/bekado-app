import 'package:bekado/data/models/user_model.dart';
import 'package:bekado/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:bekado/core/errors/failures.dart';

class UpdateUserProfile {
  final UserRepository repository;

  UpdateUserProfile(this.repository);

  Future<Either<Failure, UserModel>> call(String uid, UserModel user) async {
    return await repository.updateUserProfile(uid, user);
  }
}

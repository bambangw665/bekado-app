import 'package:bekado/core/errors/failures.dart';
import 'package:bekado/data/models/user_model.dart';
import 'package:bekado/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseDatabase firebaseDatabase;

  UserRepositoryImpl({required this.firebaseDatabase});

  @override
  Future<Either<Failure, UserModel>> getCurrentUser(String uid) async {
    try {
      DatabaseReference _databaseReference =
          firebaseDatabase.ref("akun/${uid}");
      print("Database reference path: ${_databaseReference.path}");

      print("Attempting to get snapshot from database...");
      final snapshot = await _databaseReference.get();

      if (snapshot.exists) {
        print("Snapshot exists. Value: ${snapshot.value}");
        Map<String, dynamic> _snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        print("== USER SNAPSHOT: $_snapshotValue ==");
        return Right(UserModel.fromMap(_snapshotValue));
      } else {
        print(
            "== FAIL TO GET USER INFORMATION FROM DB. Snapshot does not exist. ==");
        return Left(ServerFailure());
      }
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } catch (e) {
      print("Unexpected error: $e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> updateUserProfile(
    String uid,
    UserModel user,
  ) async {
    try {
      DatabaseReference _databaseReference =
          firebaseDatabase.ref("akun/${uid}");
      print("Database reference path: ${_databaseReference.path}");

      print("Attempting to update user profile to database...");

      await _databaseReference
          .update(user.toMap())
          .then((cb) => print("SUCCESS UPDATR USER PROFILE:"))
          .catchError((error) => print("Failed to update user: $error"));

      return Right(UserModel.fromMap(user.toMap()));
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } catch (e) {
      print("Unexpected error: $e");
      return Left(ServerFailure());
    }
  }
}

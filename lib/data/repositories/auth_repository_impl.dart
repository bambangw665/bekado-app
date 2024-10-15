import 'package:bekado/core/errors/failures.dart';
import 'package:bekado/data/models/user_model.dart';
import 'package:bekado/domain/repositories/auth_repository.dart';
import 'package:bekado/domain/usecases/get_current_user.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth firebaseAuth;
  final FirebaseDatabase firebaseDatabase;

  AuthRepositoryImpl({
    required this.firebaseAuth,
    required this.firebaseDatabase,
  });

  @override
  Future<Either<Failure, UserModel>> registerWithEmailAndPassword(String email,
      String password, String profilePic, String name, String phone) async {
    try {
      print("Attempting to sign up with email: $email");

      final newUserCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      print("== NEW USER CREDENTIAL AFTER SIGN UP: $newUserCredential ==");

      final newUser = newUserCredential.user!;
      print("User UID: ${newUser.uid}");

      DatabaseReference _databaseReference =
          firebaseDatabase.ref("akun/${newUser.uid}");
      print("Database reference path: ${_databaseReference.path}");

      print("Attempting to add new user to database...");

      Map<String, dynamic> _user = {
        'betaTester': false,
        'email': email,
        'fotoProfile': profilePic,
        'nama': name,
        'noHp': phone,
        'statusAdmin': false,
        'uid': newUser.uid
      };

      await _databaseReference
          .set(_user)
          .then((cb) => print("SUCCESS REGIST NEW USER :"))
          .catchError((error) => print("Failed to add/update user: $error"));

      return Right(UserModel.fromMap(_user));
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      return Left(AuthFailure(e.message!));
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } catch (e) {
      print("Unexpected error: $e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      print("Attempting to sign in with email: $email");
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      print("== USER CREDENTIAL AFTER SIGN IN: $userCredential ==");

      final user = userCredential.user!;
      print("User UID: ${user.uid}");

      DatabaseReference _databaseReference =
          firebaseDatabase.ref("akun/${user.uid}");
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
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      return Left(AuthFailure(e.message!));
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } catch (e) {
      print("Unexpected error: $e");
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      print("Attempting to sign out with email");
      await firebaseAuth.signOut();
      return Right(null);
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.code} - ${e.message}");
      return Left(ServerFailure());
    } catch (e) {
      print("Unexpected error: $e");
      return Left(ServerFailure());
    }
  }
}

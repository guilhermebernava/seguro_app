import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:seguro_app/app/core/utils/result.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Result<UserEntity>> signInWithGitHub() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        GithubAuthProvider githubProvider = GithubAuthProvider();
        userCredential = await FirebaseAuth.instance.signInWithPopup(
          githubProvider,
        );
      } else {
        userCredential = await FirebaseAuth.instance.signInWithProvider(
          GithubAuthProvider(),
        );
      }

      final user = userCredential.user;
      if (user == null) {
        return Result.failure('Usuário não retornado pelo GitHub');
      }

      return Result.success(
        UserEntity(
          uid: user.uid,
          email: user.email ?? '',
          image: user.photoURL,
          name: user.displayName,
        ),
      );
    } catch (e) {
      return Result.failure('Erro ao fazer login com GitHub: $e');
    }
  }

  Future<Result<UserEntity>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) throw Exception('Not Found any user');
      return Result.success(
        UserEntity(
          uid: result.user!.uid,
          email: result.user!.email ?? '',
          image: result.user!.photoURL,
          name: result.user!.displayName,
        ),
      );
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<UserEntity>> createUser(String email, String password) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) throw Exception('Not Found any user');
      return Result.success(
        UserEntity(uid: result.user!.uid, email: result.user!.email ?? ''),
      );
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<Null>> sendResetPasswordEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }

  Future<Result<Null>> confirmResetPassword(
    String code,
    String newPassword,
  ) async {
    try {
      await _auth.confirmPasswordReset(code: code, newPassword: newPassword);
      return Result.success(null);
    } catch (e) {
      return Result.failure(e.toString());
    }
  }
}

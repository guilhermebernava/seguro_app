import 'package:seguro_app/app/core/utils/result.dart';
import 'package:seguro_app/app/data/firebase/firebase_auth_datasource.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:seguro_app/app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<Result<UserEntity>> signInWithEmail(
    String email,
    String password,
  ) async => await dataSource.signInWithEmail(email, password);

  @override
  Future<Result<UserEntity>> createUser(String email, String password) async =>
      await dataSource.createUser(email, password);

  @override
  Future<Result<UserEntity>> signInWithGitHub() async =>
      await dataSource.signInWithGitHub();
}

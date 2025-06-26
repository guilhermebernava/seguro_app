import 'package:seguro_app/app/core/utils/result.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> signInWithEmail(String email, String password);
  Future<Result<UserEntity>> signInWithGitHub();

  Future<Result<UserEntity>> createUser(String email, String password);
}

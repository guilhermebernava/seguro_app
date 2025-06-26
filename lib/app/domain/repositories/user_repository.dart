import 'package:seguro_app/app/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<void> saveUser(UserEntity user);
  Future<UserEntity?> getSavedUser();
  Future<void> logoutUser();
}

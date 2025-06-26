import 'package:seguro_app/app/data/local/local_user_datasoruce.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:seguro_app/app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final LocalUserDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveUser(UserEntity user) async {
    await localDataSource.saveUser(user);
  }

  @override
  Future<UserEntity?> getSavedUser() async {
    return await localDataSource.getSavedUser();
  }

  @override
  Future<void> logoutUser() async {
    await localDataSource.logoutUser();
  }
}

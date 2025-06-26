import 'package:flutter_triple/flutter_triple.dart';
import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:seguro_app/app/domain/repositories/user_repository.dart';

class UserStore extends Store<UserEntity?> {
  final UserRepository _repository;

  UserStore(UserEntity? user, this._repository) : super(user);

  Future<void> setUser(UserEntity user, bool saveUser) async {
    if (saveUser) {
      await _repository.saveUser(user);
    }
    update(user);
  }

  Future<void> existUser() async {
    if (state != null) return;
    final user = await _repository.getSavedUser();
    if (user != null) await setUser(user, true);
  }

  Future<void> clearUser() async {
    await _repository.logoutUser();
    update(null);
  }
}

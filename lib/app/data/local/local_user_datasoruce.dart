import 'package:seguro_app/app/domain/entities/user_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalUserDataSource {
  static const String _keyUid = 'user_uid';
  static const String _keyEmail = 'user_email';
  static const String _keyImage = 'user_image';
  static const String _keyName = 'user_name';

  Future<void> saveUser(UserEntity user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyUid, user.uid);
    await prefs.setString(_keyEmail, user.email);
    if (user.image != null) await prefs.setString(_keyImage, user.image!);
    if (user.name != null) await prefs.setString(_keyName, user.name!);
  }

  Future<UserEntity?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final uid = prefs.getString(_keyUid);
    final email = prefs.getString(_keyEmail);
    final image = prefs.getString(_keyImage);
    final name = prefs.getString(_keyName);
    if (uid != null && email != null) {
      return UserEntity(uid: uid, email: email, image: image, name: name);
    }
    return null;
  }

  Future<void> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUid);
    await prefs.remove(_keyEmail);
    await prefs.remove(_keyName);
    await prefs.remove(_keyImage);
  }
}

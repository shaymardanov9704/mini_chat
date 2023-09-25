import 'package:mini_chat/core/hive/hive_base.dart';

class UserHive {
  final HiveBase _base;

  UserHive(this._base);

  Future<void> saveUserId(String id) async {
    await _base.userBox.put("user_id", id);
  }

  Future<String> getUserId() async {
    final userId = await _base.userBox.get("user_id");
    return userId;
  }

  Future<void> clear() async {
    await _base.userBox.clear();
  }
}

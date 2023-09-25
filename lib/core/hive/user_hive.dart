import 'package:mini_chat/core/hive/hive_base.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

class UserHive {
  final HiveBase _base;

  UserHive(this._base);

  Future<void> saveUserInfo(ChatUser user) async {
    await _base.userBox.put("user", user.toJson());
  }

  Future<ChatUser> getUserInfo() async {
    final userJson = await _base.userBox.get("user");
    return ChatUser.fromJson(userJson);
  }

  Future<void> clear() async {
    await _base.userBox.clear();
  }
}

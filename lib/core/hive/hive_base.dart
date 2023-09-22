import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  late final Box _cacheBox;
  late final Box _favoriteBox;
  late final Box _userBox;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}/mini_chat");
    _cacheBox = await Hive.openBox("cache");
    _favoriteBox = await Hive.openBox("favorite");
    _userBox = await Hive.openBox("user");
  }


  Box get cacheBox => _cacheBox;

  Box get favoriteBox => _favoriteBox;

  Box get userBox => _userBox;
}

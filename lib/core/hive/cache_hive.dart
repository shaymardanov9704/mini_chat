import 'package:flutter/material.dart';
import 'package:mini_chat/core/hive/hive_base.dart';

class CacheHive {
  final HiveBase _base;

  CacheHive(this._base);

  Future<void> setFirstTime() async {
    await _base.cacheBox.put("firstTime", false);
  }

  bool get firstTime => _base.cacheBox.get("firstTime", defaultValue: true);

  Future<void> saveThemeMode(ThemeMode mode) =>
      _base.cacheBox.put("ThemeMode", mode.name);

  ThemeMode get themeMode {
    final mode = _base.cacheBox.get("ThemeMode", defaultValue: "light");
    final index = ThemeMode.values.toList().indexWhere((e) => e.name == mode);
    return ThemeMode.values[index];
  }

  Future<void> saveLanguage(String language) =>
      _base.cacheBox.put("language", language);

  String get language {
    final language = _base.cacheBox.get("language", defaultValue: "uz");
    return language;
  }
}

import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';
import 'package:mini_chat/core/firebase/firebase_service.dart';
import 'package:mini_chat/core/firebase/firestore_service.dart';
import 'package:mini_chat/core/firebase/storage_service.dart';
import 'package:mini_chat/core/firebase/users_service.dart';
import 'package:mini_chat/core/hive/cache_hive.dart';
import 'package:mini_chat/core/hive/hive_base.dart';
import 'package:mini_chat/core/hive/user_hive.dart';
import 'package:mini_chat/firebase_options.dart';

final di = GetIt.instance;

setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _setupConfigs();
  await _setupFactories();
}

Future<void> _setupConfigs() async {
  HttpOverrides.global = _MyHttpOverrides();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, name: "Firebase");
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 1)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.black.withOpacity(0.5)
    ..errorWidget
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.black.withOpacity(0.2)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future<void> _setupFactories() async {
  di.registerSingleton(HiveBase());

  await di.get<HiveBase>().init();
  di.registerSingleton(FirestoreService());
  di.registerFactory(() => FirebaseService(di.get()));
  di.registerFactory(() => UsersService(
        di.get<FirestoreService>(),
        di.get(),
        di.get<StorageService>(),
      ));
  di.registerFactory(() => AuthService(di.get(), di.get()));
  di.registerFactory(() => StorageService(di.get()));
  di.registerFactory(() => UserHive(di.get<HiveBase>()));
  di.registerFactory(() => CacheHive(di.get<HiveBase>()));
}

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

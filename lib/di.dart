import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';
import 'package:mini_chat/core/firebase/firestore_service.dart';
import 'package:mini_chat/core/firebase/users_service.dart';
import 'package:mini_chat/core/hive/cache_hive.dart';
import 'package:mini_chat/core/hive/hive_base.dart';
import 'package:mini_chat/core/hive/user_hive.dart';

import 'core/firebase/storage_service.dart';

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



/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
            'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
              'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBytaD_roFj9ertV-wwIgS6P5aoCZ1tYxg',
    appId: '1:41558850945:android:bab2c5a8bd83b0ca557c80',
    messagingSenderId: '41558850945',
    projectId: 'chateo-8fb31',
    databaseURL: 'https://chateo-8fb31-default-rtdb.firebaseio.com',
    storageBucket: 'chateo-8fb31.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCy2rGX6mGRj4aRV8qEe4xki65h-7Mk-ks',
    appId: '1:41558850945:ios:031f2875c9503aef557c80',
    messagingSenderId: '41558850945',
    projectId: 'chateo-8fb31',
    databaseURL: 'https://chateo-8fb31-default-rtdb.firebaseio.com',
    storageBucket: 'chateo-8fb31.appspot.com',
    androidClientId: '41558850945-eqe8atqondnoug8khfv5m56ejuh2ejrd.apps.googleusercontent.com',
    iosClientId: '41558850945-vlflr1hp74fa1ovhiahtdbhh65rmhhkh.apps.googleusercontent.com',
    iosBundleId: 'com.example.miniChat',
  );
}


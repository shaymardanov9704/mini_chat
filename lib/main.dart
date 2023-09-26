import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/pages/auth/auth_page.dart';
import 'package:mini_chat/presentation/pages/splash/splash_page.dart';
import 'package:mini_chat/presentation/screens/splash_screen.dart';

late Size mq;

void main() async {
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const SplashPage( ),
      builder: EasyLoading.init(),
    );
  }
}

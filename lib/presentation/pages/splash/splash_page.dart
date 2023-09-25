import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/pages/home/home_page.dart';
import 'bloc/splash_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final bloc = SplashBloc(di.get());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(SplashEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state.uid.isNotEmpty) {
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (_) => const HomePage()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Splash")),
          );
        },
      ),
    );
  }
}

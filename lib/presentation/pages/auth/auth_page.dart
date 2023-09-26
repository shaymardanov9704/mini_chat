import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/pages/home/home_page.dart';
import 'bloc/auth_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final bloc = AuthBloc(di.get());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.status == EnumStatus.success) {
            EasyLoading.showSuccess("Succes");
            Navigator.pushReplacement(
              context,
              CupertinoPageRoute(builder: (_) => const HomePage()),
            );
          } else if (state.status == EnumStatus.loading) {
            EasyLoading.show();
          } else if (state.status == EnumStatus.fail) {
            EasyLoading.showError("Error");
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("images/icon.png"),
                      const Text("Mini Chat App",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w800),),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      bloc.add(AuthEvent.auth());
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/google.png", width: 25),
                            const SizedBox(width: 16),
                            const Text(
                              "Sign In With Google",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

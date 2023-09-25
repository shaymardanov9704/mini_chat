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
            appBar: AppBar(title: const Text("AuthPage")),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                bloc.add(AuthEvent.auth());
              },
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/users_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final bloc = UsersBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
           return Scaffold(
            appBar: AppBar(title: const Text("Users")),
          );
        },
      ),
    );
  }
}

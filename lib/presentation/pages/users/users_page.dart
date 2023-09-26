import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/widgets/chat_user_card.dart';
import 'bloc/users_bloc.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  final bloc = UsersBloc(di.get());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(UsersEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<UsersBloc, UsersState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Users")),
            body: ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, i) {
                return ChatUserCard(user: state.users[i]);
              },
            ),
          );
        },
      ),
    );
  }
}

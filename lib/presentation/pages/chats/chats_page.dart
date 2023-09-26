import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/widgets/chat_user_card.dart';
import 'bloc/chats_bloc.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final bloc = ChatsBloc(di.get());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(ChatsEvent.init());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text("Chats")),
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

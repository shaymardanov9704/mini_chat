import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/pages/test/bloc/bloc.dart';

class TestPage extends StatefulWidget {
  final ChatUser user;

  const TestPage({Key? key, required this.user}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final bloc = ChatBloc(di.get());

  @override
  void initState() {
    bloc.add(ChatEvent.loadMessages(widget.user));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocConsumer<ChatBloc, ChatState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(state.messages.length.toString()),
            ),
            body: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (_,i){
              // final message = state.messages[i].;
              return Card(
                child: Center(child: Text("message"),),
              );
            }),
          );
        },
      ),
    );
  }
}

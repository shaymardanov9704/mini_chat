import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/chats_bloc.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  State<ChatsPage> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  final bloc = ChatsBloc();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<ChatsBloc, ChatsState>(
        builder: (context, state) {
           return Scaffold(
            appBar: AppBar(title: const Text("Chats")),
          );
        },
      ),
    );
  }
}

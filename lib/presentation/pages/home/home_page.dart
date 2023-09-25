import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_chat/di.dart';
import 'package:mini_chat/presentation/pages/chats/chats_page.dart';
import 'package:mini_chat/presentation/pages/more/more_page.dart';
import 'package:mini_chat/presentation/pages/users/users_page.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = HomeBloc(di.get(), di.get())..add(HomeEvent.init());
  int _activeIndex = 0;

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  void initState() {
    bloc.add(HomeEvent.init());
    super.initState();
  }

  void onChange(int i) {
    setState(() {
      _activeIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            body: IndexedStack(
              index: _activeIndex,
              children: const [
                UsersPage(),
                ChatsPage(),
                MorePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _activeIndex,
              onTap: onChange,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.people),
                  label: "Users",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz),
                  label: "More",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

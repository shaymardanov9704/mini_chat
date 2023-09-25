import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/users_service.dart';
import 'package:mini_chat/core/hive/user_hive.dart';
import 'package:mini_chat/models/chat_user_model.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserHive hive;
  final UsersService usersService;

  HomeBloc(this.hive, this.usersService) : super(HomeState.state(user: ChatUser.fromJson({}))) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<HomeState> emit,
  ) async {
    final user = await hive.getUserInfo();
    emit(state.copyWith(user: user));
  }
}

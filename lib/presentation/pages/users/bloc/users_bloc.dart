import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/firebase_service.dart';
import 'package:mini_chat/core/firebase/users_service.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

part 'users_event.dart';

part 'users_state.dart';

part 'users_bloc.freezed.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final FirebaseService firebaseService;

  UsersBloc(this.firebaseService) : super(UsersState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<UsersState> emit,
  ) async {
    try {
      final users = await firebaseService.fetchAllUsers();
      emit(state.copyWith(users: users, status: EnumStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }
}

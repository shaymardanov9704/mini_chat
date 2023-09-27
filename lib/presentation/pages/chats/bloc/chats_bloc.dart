import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/firebase_service.dart';
import 'package:mini_chat/core/firebase/users_service.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

part 'chats_event.dart';

part 'chats_state.dart';

part 'chats_bloc.freezed.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  final FirebaseService firebaseService;

  ChatsBloc(this.firebaseService) : super(ChatsState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<ChatsState> emit,
  ) async {
    try {
      final users = await firebaseService.fetchMyUsers();
      users.forEach((element) {print(element.about);});
      emit(state.copyWith(users: users, status: EnumStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }
}

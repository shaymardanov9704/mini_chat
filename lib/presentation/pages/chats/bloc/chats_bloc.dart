import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_event.dart';

part 'chats_state.dart';

part 'chats_bloc.freezed.dart';

class ChatsBloc
    extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc() : super(ChatsState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<ChatsState> emit,
  ) async {}
}


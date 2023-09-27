import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/firebase_service.dart';
import 'package:mini_chat/core/models/chat_user_model.dart';

part 'event.dart';

part 'state.dart';

part 'bloc.freezed.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final FirebaseService _repository;

  ChatBloc(this._repository) : super(const ChatState.state()) {
    on<LoadMessages>(
      (event, emit) async {
        mapEventToState(event);
      },
    );
  }

  @override
  Stream<ChatState> mapEventToState(ChatEvent event) async* {
    try {
      if (event is LoadMessages) {
        final messages = await _repository.getAllMessages(event.user).toList();
        yield state.copyWith(messages: messages, status: EnumStatus.success);
      }
    } catch (e) {
      yield state.copyWith(status: EnumStatus.fail);
    }
  }
}

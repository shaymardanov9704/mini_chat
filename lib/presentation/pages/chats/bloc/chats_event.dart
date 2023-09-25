part of 'chats_bloc.dart';

@freezed
abstract class ChatsEvent with _$ChatsEvent {
  factory ChatsEvent.init() = _init;
}

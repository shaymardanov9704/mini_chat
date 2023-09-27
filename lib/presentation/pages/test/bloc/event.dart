part of 'bloc.dart';
@freezed
abstract class ChatEvent with _$ChatEvent {
  const factory ChatEvent.loadMessages(ChatUser user) = LoadMessages;
}

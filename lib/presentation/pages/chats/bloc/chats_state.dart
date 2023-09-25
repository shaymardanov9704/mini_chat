part of 'chats_bloc.dart';

@freezed
abstract class ChatsState with _$ChatsState {
  factory ChatsState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }

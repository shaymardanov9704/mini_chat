part of 'bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default([]) List<QuerySnapshot<Map<String, dynamic>>> messages,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }
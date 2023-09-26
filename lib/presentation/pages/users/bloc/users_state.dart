part of 'users_bloc.dart';

@freezed
abstract class UsersState with _$UsersState {
  factory UsersState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default([])List<ChatUser> users,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }

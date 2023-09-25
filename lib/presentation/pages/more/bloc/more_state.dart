part of 'more_bloc.dart';

@freezed
abstract class MoreState with _$MoreState {
  factory MoreState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success }

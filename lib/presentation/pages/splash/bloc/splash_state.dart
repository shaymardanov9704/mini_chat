part of 'splash_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  factory SplashState.state({
    @Default(EnumStatus.initial) EnumStatus status,
    @Default("") String message,
  }) = _state;
}

enum EnumStatus { initial, loading, fail, success, auth}

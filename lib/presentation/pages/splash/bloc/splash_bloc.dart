import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/hive/user_hive.dart';

part 'splash_event.dart';

part 'splash_state.dart';

part 'splash_bloc.freezed.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserHive hive;

  SplashBloc(this.hive) : super(SplashState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(status: EnumStatus.initial));
    final uid = await hive.getUserId();

    emit(state.copyWith(uid: uid, status: EnumStatus.success));
  }
}

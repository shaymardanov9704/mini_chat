import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_event.dart';

part 'users_state.dart';

part 'users_bloc.freezed.dart';

class UsersBloc
    extends Bloc<UsersEvent, UsersState> {
  UsersBloc() : super(UsersState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<UsersState> emit,
  ) async {}
}


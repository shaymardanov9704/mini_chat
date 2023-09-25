import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'more_event.dart';

part 'more_state.dart';

part 'more_bloc.freezed.dart';

class MoreBloc
    extends Bloc<MoreEvent, MoreState> {
  MoreBloc() : super(MoreState.state()) {
    on<_init>(_emitInit);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<MoreState> emit,
  ) async {}
}


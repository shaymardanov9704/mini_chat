import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService;

  AuthBloc(this._authService) : super(AuthState.state()) {
    on<_auth>(_emitAuth);
  }

  Future<void> _emitAuth(
    _auth event,
    Emitter<AuthState> emit,
  ) async {
    try {
      await _authService.signInWithGoogle();
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
    try {
      emit(state.copyWith(status: EnumStatus.loading));
      final uid = _authService.auth.currentUser!.uid;
      if (await _authService.userExists(uid: uid)) {
        await _authService.createUser();
      } else {
        await _authService.fetchUser(uid);
      }
      emit(state.copyWith(status: EnumStatus.success));
    } catch (e) {
      emit(state.copyWith(status: EnumStatus.fail));
    }
  }
}

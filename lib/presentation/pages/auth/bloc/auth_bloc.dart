import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mini_chat/core/firebase/auth_service.dart';
import 'package:mini_chat/core/hive/user_hive.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserHive _hive;
  final AuthService _authService;

  AuthBloc(this._authService, this._hive) : super(AuthState.state()) {
    on<_init>(_emitInit);
    on<_auth>(_emitAuth);
  }

  Future<void> _emitInit(
    _init event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> _emitAuth(
    _auth event,
    Emitter<AuthState> emit,
  ) async {
    await _authService.signInWithGoogle();
    final userExist =
        await _authService.userExists(uid: _authService.auth.currentUser!.uid);
    userExist == false ? _authService.createUser() : null;
  }
}

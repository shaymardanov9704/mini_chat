part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  factory AuthEvent.init() = _init;
  factory AuthEvent.auth() = _auth;
}

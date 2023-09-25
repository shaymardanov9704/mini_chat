part of 'users_bloc.dart';

@freezed
abstract class UsersEvent with _$UsersEvent {
  factory UsersEvent.init() = _init;
}

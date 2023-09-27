// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatEvent {
  ChatUser get user => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatUser user) loadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatUser user)? loadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatUser user)? loadMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMessages value) loadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMessages value)? loadMessages,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMessages value)? loadMessages,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatEventCopyWith<ChatEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
  @useResult
  $Res call({ChatUser user});
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUser,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadMessagesCopyWith<$Res>
    implements $ChatEventCopyWith<$Res> {
  factory _$$LoadMessagesCopyWith(
          _$LoadMessages value, $Res Function(_$LoadMessages) then) =
      __$$LoadMessagesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatUser user});
}

/// @nodoc
class __$$LoadMessagesCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$LoadMessages>
    implements _$$LoadMessagesCopyWith<$Res> {
  __$$LoadMessagesCopyWithImpl(
      _$LoadMessages _value, $Res Function(_$LoadMessages) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$LoadMessages(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as ChatUser,
    ));
  }
}

/// @nodoc

class _$LoadMessages implements LoadMessages {
  const _$LoadMessages(this.user);

  @override
  final ChatUser user;

  @override
  String toString() {
    return 'ChatEvent.loadMessages(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMessages &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMessagesCopyWith<_$LoadMessages> get copyWith =>
      __$$LoadMessagesCopyWithImpl<_$LoadMessages>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ChatUser user) loadMessages,
  }) {
    return loadMessages(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ChatUser user)? loadMessages,
  }) {
    return loadMessages?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ChatUser user)? loadMessages,
    required TResult orElse(),
  }) {
    if (loadMessages != null) {
      return loadMessages(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadMessages value) loadMessages,
  }) {
    return loadMessages(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadMessages value)? loadMessages,
  }) {
    return loadMessages?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadMessages value)? loadMessages,
    required TResult orElse(),
  }) {
    if (loadMessages != null) {
      return loadMessages(this);
    }
    return orElse();
  }
}

abstract class LoadMessages implements ChatEvent {
  const factory LoadMessages(final ChatUser user) = _$LoadMessages;

  @override
  ChatUser get user;
  @override
  @JsonKey(ignore: true)
  _$$LoadMessagesCopyWith<_$LoadMessages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  EnumStatus get status => throw _privateConstructorUsedError;
  List<QuerySnapshot<Map<String, dynamic>>> get messages =>
      throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatStateCopyWith<ChatState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
  @useResult
  $Res call(
      {EnumStatus status,
      List<QuerySnapshot<Map<String, dynamic>>> messages,
      String message});
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<QuerySnapshot<Map<String, dynamic>>>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_stateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$$_stateCopyWith(_$_state value, $Res Function(_$_state) then) =
      __$$_stateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {EnumStatus status,
      List<QuerySnapshot<Map<String, dynamic>>> messages,
      String message});
}

/// @nodoc
class __$$_stateCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$_state>
    implements _$$_stateCopyWith<$Res> {
  __$$_stateCopyWithImpl(_$_state _value, $Res Function(_$_state) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? messages = null,
    Object? message = null,
  }) {
    return _then(_$_state(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      messages: null == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<QuerySnapshot<Map<String, dynamic>>>,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_state implements _state {
  const _$_state(
      {this.status = EnumStatus.initial,
      final List<QuerySnapshot<Map<String, dynamic>>> messages = const [],
      this.message = ""})
      : _messages = messages;

  @override
  @JsonKey()
  final EnumStatus status;
  final List<QuerySnapshot<Map<String, dynamic>>> _messages;
  @override
  @JsonKey()
  List<QuerySnapshot<Map<String, dynamic>>> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'ChatState.state(status: $status, messages: $messages, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_state &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_messages), message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_stateCopyWith<_$_state> get copyWith =>
      __$$_stateCopyWithImpl<_$_state>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)
        state,
  }) {
    return state(status, messages, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)?
        state,
  }) {
    return state?.call(status, messages, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EnumStatus status,
            List<QuerySnapshot<Map<String, dynamic>>> messages, String message)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(status, messages, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _state implements ChatState {
  const factory _state(
      {final EnumStatus status,
      final List<QuerySnapshot<Map<String, dynamic>>> messages,
      final String message}) = _$_state;

  @override
  EnumStatus get status;
  @override
  List<QuerySnapshot<Map<String, dynamic>>> get messages;
  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_stateCopyWith<_$_state> get copyWith =>
      throw _privateConstructorUsedError;
}

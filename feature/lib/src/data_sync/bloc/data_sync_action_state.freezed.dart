// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_sync_action_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataSyncActionState {
  DataSyncAction get action => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataSyncActionStateCopyWith<DataSyncActionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncActionStateCopyWith<$Res> {
  factory $DataSyncActionStateCopyWith(
          DataSyncActionState value, $Res Function(DataSyncActionState) then) =
      _$DataSyncActionStateCopyWithImpl<$Res, DataSyncActionState>;
  @useResult
  $Res call({DataSyncAction action});
}

/// @nodoc
class _$DataSyncActionStateCopyWithImpl<$Res, $Val extends DataSyncActionState>
    implements $DataSyncActionStateCopyWith<$Res> {
  _$DataSyncActionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_value.copyWith(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as DataSyncAction,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataSyncActionStateCopyWith<$Res>
    implements $DataSyncActionStateCopyWith<$Res> {
  factory _$$_DataSyncActionStateCopyWith(_$_DataSyncActionState value,
          $Res Function(_$_DataSyncActionState) then) =
      __$$_DataSyncActionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DataSyncAction action});
}

/// @nodoc
class __$$_DataSyncActionStateCopyWithImpl<$Res>
    extends _$DataSyncActionStateCopyWithImpl<$Res, _$_DataSyncActionState>
    implements _$$_DataSyncActionStateCopyWith<$Res> {
  __$$_DataSyncActionStateCopyWithImpl(_$_DataSyncActionState _value,
      $Res Function(_$_DataSyncActionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? action = null,
  }) {
    return _then(_$_DataSyncActionState(
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as DataSyncAction,
    ));
  }
}

/// @nodoc

class _$_DataSyncActionState implements _DataSyncActionState {
  const _$_DataSyncActionState({required this.action});

  @override
  final DataSyncAction action;

  @override
  String toString() {
    return 'DataSyncActionState(action: $action)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataSyncActionState &&
            (identical(other.action, action) || other.action == action));
  }

  @override
  int get hashCode => Object.hash(runtimeType, action);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataSyncActionStateCopyWith<_$_DataSyncActionState> get copyWith =>
      __$$_DataSyncActionStateCopyWithImpl<_$_DataSyncActionState>(
          this, _$identity);
}

abstract class _DataSyncActionState implements DataSyncActionState {
  const factory _DataSyncActionState({required final DataSyncAction action}) =
      _$_DataSyncActionState;

  @override
  DataSyncAction get action;
  @override
  @JsonKey(ignore: true)
  _$$_DataSyncActionStateCopyWith<_$_DataSyncActionState> get copyWith =>
      throw _privateConstructorUsedError;
}

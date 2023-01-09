// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_sync_v2_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataSyncV2State {
  DataSyncV2Status get status => throw _privateConstructorUsedError;
  List<Book>? get books => throw _privateConstructorUsedError;
  String? get lastSync => throw _privateConstructorUsedError;
  int? get fetchProgress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataSyncV2StateCopyWith<DataSyncV2State> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncV2StateCopyWith<$Res> {
  factory $DataSyncV2StateCopyWith(
          DataSyncV2State value, $Res Function(DataSyncV2State) then) =
      _$DataSyncV2StateCopyWithImpl<$Res, DataSyncV2State>;
  @useResult
  $Res call(
      {DataSyncV2Status status,
      List<Book>? books,
      String? lastSync,
      int? fetchProgress});
}

/// @nodoc
class _$DataSyncV2StateCopyWithImpl<$Res, $Val extends DataSyncV2State>
    implements $DataSyncV2StateCopyWith<$Res> {
  _$DataSyncV2StateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? books = freezed,
    Object? lastSync = freezed,
    Object? fetchProgress = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataSyncV2Status,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchProgress: freezed == fetchProgress
          ? _value.fetchProgress
          : fetchProgress // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataSyncV2StateCopyWith<$Res>
    implements $DataSyncV2StateCopyWith<$Res> {
  factory _$$_DataSyncV2StateCopyWith(
          _$_DataSyncV2State value, $Res Function(_$_DataSyncV2State) then) =
      __$$_DataSyncV2StateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DataSyncV2Status status,
      List<Book>? books,
      String? lastSync,
      int? fetchProgress});
}

/// @nodoc
class __$$_DataSyncV2StateCopyWithImpl<$Res>
    extends _$DataSyncV2StateCopyWithImpl<$Res, _$_DataSyncV2State>
    implements _$$_DataSyncV2StateCopyWith<$Res> {
  __$$_DataSyncV2StateCopyWithImpl(
      _$_DataSyncV2State _value, $Res Function(_$_DataSyncV2State) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? books = freezed,
    Object? lastSync = freezed,
    Object? fetchProgress = freezed,
  }) {
    return _then(_$_DataSyncV2State(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as DataSyncV2Status,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
      fetchProgress: freezed == fetchProgress
          ? _value.fetchProgress
          : fetchProgress // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_DataSyncV2State implements _DataSyncV2State {
  const _$_DataSyncV2State(this.status,
      {final List<Book>? books, this.lastSync, this.fetchProgress})
      : _books = books;

  @override
  final DataSyncV2Status status;
  final List<Book>? _books;
  @override
  List<Book>? get books {
    final value = _books;
    if (value == null) return null;
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? lastSync;
  @override
  final int? fetchProgress;

  @override
  String toString() {
    return 'DataSyncV2State(status: $status, books: $books, lastSync: $lastSync, fetchProgress: $fetchProgress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataSyncV2State &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.fetchProgress, fetchProgress) ||
                other.fetchProgress == fetchProgress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_books), lastSync, fetchProgress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataSyncV2StateCopyWith<_$_DataSyncV2State> get copyWith =>
      __$$_DataSyncV2StateCopyWithImpl<_$_DataSyncV2State>(this, _$identity);
}

abstract class _DataSyncV2State implements DataSyncV2State {
  const factory _DataSyncV2State(final DataSyncV2Status status,
      {final List<Book>? books,
      final String? lastSync,
      final int? fetchProgress}) = _$_DataSyncV2State;

  @override
  DataSyncV2Status get status;
  @override
  List<Book>? get books;
  @override
  String? get lastSync;
  @override
  int? get fetchProgress;
  @override
  @JsonKey(ignore: true)
  _$$_DataSyncV2StateCopyWith<_$_DataSyncV2State> get copyWith =>
      throw _privateConstructorUsedError;
}

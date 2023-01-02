// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  HomeStatus get status => throw _privateConstructorUsedError;
  List<Book>? get books => throw _privateConstructorUsedError;
  String? get lastSync => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({HomeStatus status, List<Book>? books, String? lastSync});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

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
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStatus,
      books: freezed == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_FeedStateCopyWith(
          _$_FeedState value, $Res Function(_$_FeedState) then) =
      __$$_FeedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStatus status, List<Book>? books, String? lastSync});
}

/// @nodoc
class __$$_FeedStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_FeedState>
    implements _$$_FeedStateCopyWith<$Res> {
  __$$_FeedStateCopyWithImpl(
      _$_FeedState _value, $Res Function(_$_FeedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? books = freezed,
    Object? lastSync = freezed,
  }) {
    return _then(_$_FeedState(
      null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as HomeStatus,
      books: freezed == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<Book>?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_FeedState implements _FeedState {
  const _$_FeedState(this.status, {final List<Book>? books, this.lastSync})
      : _books = books;

  @override
  final HomeStatus status;
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
  String toString() {
    return 'HomeState(status: $status, books: $books, lastSync: $lastSync)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._books, _books) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status,
      const DeepCollectionEquality().hash(_books), lastSync);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      __$$_FeedStateCopyWithImpl<_$_FeedState>(this, _$identity);
}

abstract class _FeedState implements HomeState {
  const factory _FeedState(final HomeStatus status,
      {final List<Book>? books, final String? lastSync}) = _$_FeedState;

  @override
  HomeStatus get status;
  @override
  List<Book>? get books;
  @override
  String? get lastSync;
  @override
  @JsonKey(ignore: true)
  _$$_FeedStateCopyWith<_$_FeedState> get copyWith =>
      throw _privateConstructorUsedError;
}

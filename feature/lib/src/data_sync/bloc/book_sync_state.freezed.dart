// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookSyncState {
  int get bookId => throw _privateConstructorUsedError;
  String get bookName => throw _privateConstructorUsedError;
  String? get coverUrl => throw _privateConstructorUsedError;
  String? get lastSync => throw _privateConstructorUsedError;
  bool get isDownloading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookSyncStateCopyWith<BookSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSyncStateCopyWith<$Res> {
  factory $BookSyncStateCopyWith(
          BookSyncState value, $Res Function(BookSyncState) then) =
      _$BookSyncStateCopyWithImpl<$Res, BookSyncState>;
  @useResult
  $Res call(
      {int bookId,
      String bookName,
      String? coverUrl,
      String? lastSync,
      bool isDownloading});
}

/// @nodoc
class _$BookSyncStateCopyWithImpl<$Res, $Val extends BookSyncState>
    implements $BookSyncStateCopyWith<$Res> {
  _$BookSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookName = null,
    Object? coverUrl = freezed,
    Object? lastSync = freezed,
    Object? isDownloading = null,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookSyncStateCopyWith<$Res>
    implements $BookSyncStateCopyWith<$Res> {
  factory _$$_BookSyncStateCopyWith(
          _$_BookSyncState value, $Res Function(_$_BookSyncState) then) =
      __$$_BookSyncStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookId,
      String bookName,
      String? coverUrl,
      String? lastSync,
      bool isDownloading});
}

/// @nodoc
class __$$_BookSyncStateCopyWithImpl<$Res>
    extends _$BookSyncStateCopyWithImpl<$Res, _$_BookSyncState>
    implements _$$_BookSyncStateCopyWith<$Res> {
  __$$_BookSyncStateCopyWithImpl(
      _$_BookSyncState _value, $Res Function(_$_BookSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookName = null,
    Object? coverUrl = freezed,
    Object? lastSync = freezed,
    Object? isDownloading = null,
  }) {
    return _then(_$_BookSyncState(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      bookName: null == bookName
          ? _value.bookName
          : bookName // ignore: cast_nullable_to_non_nullable
              as String,
      coverUrl: freezed == coverUrl
          ? _value.coverUrl
          : coverUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      lastSync: freezed == lastSync
          ? _value.lastSync
          : lastSync // ignore: cast_nullable_to_non_nullable
              as String?,
      isDownloading: null == isDownloading
          ? _value.isDownloading
          : isDownloading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BookSyncState implements _BookSyncState {
  const _$_BookSyncState(
      {required this.bookId,
      required this.bookName,
      this.coverUrl,
      this.lastSync,
      required this.isDownloading});

  @override
  final int bookId;
  @override
  final String bookName;
  @override
  final String? coverUrl;
  @override
  final String? lastSync;
  @override
  final bool isDownloading;

  @override
  String toString() {
    return 'BookSyncState(bookId: $bookId, bookName: $bookName, coverUrl: $coverUrl, lastSync: $lastSync, isDownloading: $isDownloading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookSyncState &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookName, bookName) ||
                other.bookName == bookName) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.lastSync, lastSync) ||
                other.lastSync == lastSync) &&
            (identical(other.isDownloading, isDownloading) ||
                other.isDownloading == isDownloading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, bookId, bookName, coverUrl, lastSync, isDownloading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookSyncStateCopyWith<_$_BookSyncState> get copyWith =>
      __$$_BookSyncStateCopyWithImpl<_$_BookSyncState>(this, _$identity);
}

abstract class _BookSyncState implements BookSyncState {
  const factory _BookSyncState(
      {required final int bookId,
      required final String bookName,
      final String? coverUrl,
      final String? lastSync,
      required final bool isDownloading}) = _$_BookSyncState;

  @override
  int get bookId;
  @override
  String get bookName;
  @override
  String? get coverUrl;
  @override
  String? get lastSync;
  @override
  bool get isDownloading;
  @override
  @JsonKey(ignore: true)
  _$$_BookSyncStateCopyWith<_$_BookSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_sync_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BookSyncStatus {
  int get bookId => throw _privateConstructorUsedError;
  String get bookTitle => throw _privateConstructorUsedError;
  String get coverImageUrl => throw _privateConstructorUsedError;
  int get totalHighlightCount => throw _privateConstructorUsedError;
  int get fetchedHighlightCount => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookSyncStatusCopyWith<BookSyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookSyncStatusCopyWith<$Res> {
  factory $BookSyncStatusCopyWith(
          BookSyncStatus value, $Res Function(BookSyncStatus) then) =
      _$BookSyncStatusCopyWithImpl<$Res, BookSyncStatus>;
  @useResult
  $Res call(
      {int bookId,
      String bookTitle,
      String coverImageUrl,
      int totalHighlightCount,
      int fetchedHighlightCount,
      String updatedAt});
}

/// @nodoc
class _$BookSyncStatusCopyWithImpl<$Res, $Val extends BookSyncStatus>
    implements $BookSyncStatusCopyWith<$Res> {
  _$BookSyncStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookTitle = null,
    Object? coverImageUrl = null,
    Object? totalHighlightCount = null,
    Object? fetchedHighlightCount = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      bookId: null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      bookTitle: null == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      coverImageUrl: null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalHighlightCount: null == totalHighlightCount
          ? _value.totalHighlightCount
          : totalHighlightCount // ignore: cast_nullable_to_non_nullable
              as int,
      fetchedHighlightCount: null == fetchedHighlightCount
          ? _value.fetchedHighlightCount
          : fetchedHighlightCount // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookSyncStatusCopyWith<$Res>
    implements $BookSyncStatusCopyWith<$Res> {
  factory _$$_BookSyncStatusCopyWith(
          _$_BookSyncStatus value, $Res Function(_$_BookSyncStatus) then) =
      __$$_BookSyncStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int bookId,
      String bookTitle,
      String coverImageUrl,
      int totalHighlightCount,
      int fetchedHighlightCount,
      String updatedAt});
}

/// @nodoc
class __$$_BookSyncStatusCopyWithImpl<$Res>
    extends _$BookSyncStatusCopyWithImpl<$Res, _$_BookSyncStatus>
    implements _$$_BookSyncStatusCopyWith<$Res> {
  __$$_BookSyncStatusCopyWithImpl(
      _$_BookSyncStatus _value, $Res Function(_$_BookSyncStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookId = null,
    Object? bookTitle = null,
    Object? coverImageUrl = null,
    Object? totalHighlightCount = null,
    Object? fetchedHighlightCount = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_BookSyncStatus(
      null == bookId
          ? _value.bookId
          : bookId // ignore: cast_nullable_to_non_nullable
              as int,
      null == bookTitle
          ? _value.bookTitle
          : bookTitle // ignore: cast_nullable_to_non_nullable
              as String,
      null == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == totalHighlightCount
          ? _value.totalHighlightCount
          : totalHighlightCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == fetchedHighlightCount
          ? _value.fetchedHighlightCount
          : fetchedHighlightCount // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BookSyncStatus implements _BookSyncStatus {
  const _$_BookSyncStatus(this.bookId, this.bookTitle, this.coverImageUrl,
      this.totalHighlightCount, this.fetchedHighlightCount, this.updatedAt);

  @override
  final int bookId;
  @override
  final String bookTitle;
  @override
  final String coverImageUrl;
  @override
  final int totalHighlightCount;
  @override
  final int fetchedHighlightCount;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'BookSyncStatus(bookId: $bookId, bookTitle: $bookTitle, coverImageUrl: $coverImageUrl, totalHighlightCount: $totalHighlightCount, fetchedHighlightCount: $fetchedHighlightCount, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookSyncStatus &&
            (identical(other.bookId, bookId) || other.bookId == bookId) &&
            (identical(other.bookTitle, bookTitle) ||
                other.bookTitle == bookTitle) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.totalHighlightCount, totalHighlightCount) ||
                other.totalHighlightCount == totalHighlightCount) &&
            (identical(other.fetchedHighlightCount, fetchedHighlightCount) ||
                other.fetchedHighlightCount == fetchedHighlightCount) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bookId, bookTitle, coverImageUrl,
      totalHighlightCount, fetchedHighlightCount, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookSyncStatusCopyWith<_$_BookSyncStatus> get copyWith =>
      __$$_BookSyncStatusCopyWithImpl<_$_BookSyncStatus>(this, _$identity);
}

abstract class _BookSyncStatus implements BookSyncStatus {
  const factory _BookSyncStatus(
      final int bookId,
      final String bookTitle,
      final String coverImageUrl,
      final int totalHighlightCount,
      final int fetchedHighlightCount,
      final String updatedAt) = _$_BookSyncStatus;

  @override
  int get bookId;
  @override
  String get bookTitle;
  @override
  String get coverImageUrl;
  @override
  int get totalHighlightCount;
  @override
  int get fetchedHighlightCount;
  @override
  String get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_BookSyncStatusCopyWith<_$_BookSyncStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

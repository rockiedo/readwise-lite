// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'data_sync_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataSyncState {
  List<BookSyncState> get bookStates => throw _privateConstructorUsedError;
  bool get isDownloadingBooks => throw _privateConstructorUsedError;
  Set<int> get booksInSync => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataSyncStateCopyWith<DataSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataSyncStateCopyWith<$Res> {
  factory $DataSyncStateCopyWith(
          DataSyncState value, $Res Function(DataSyncState) then) =
      _$DataSyncStateCopyWithImpl<$Res, DataSyncState>;
  @useResult
  $Res call(
      {List<BookSyncState> bookStates,
      bool isDownloadingBooks,
      Set<int> booksInSync});
}

/// @nodoc
class _$DataSyncStateCopyWithImpl<$Res, $Val extends DataSyncState>
    implements $DataSyncStateCopyWith<$Res> {
  _$DataSyncStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookStates = null,
    Object? isDownloadingBooks = null,
    Object? booksInSync = null,
  }) {
    return _then(_value.copyWith(
      bookStates: null == bookStates
          ? _value.bookStates
          : bookStates // ignore: cast_nullable_to_non_nullable
              as List<BookSyncState>,
      isDownloadingBooks: null == isDownloadingBooks
          ? _value.isDownloadingBooks
          : isDownloadingBooks // ignore: cast_nullable_to_non_nullable
              as bool,
      booksInSync: null == booksInSync
          ? _value.booksInSync
          : booksInSync // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DataSyncStateCopyWith<$Res>
    implements $DataSyncStateCopyWith<$Res> {
  factory _$$_DataSyncStateCopyWith(
          _$_DataSyncState value, $Res Function(_$_DataSyncState) then) =
      __$$_DataSyncStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<BookSyncState> bookStates,
      bool isDownloadingBooks,
      Set<int> booksInSync});
}

/// @nodoc
class __$$_DataSyncStateCopyWithImpl<$Res>
    extends _$DataSyncStateCopyWithImpl<$Res, _$_DataSyncState>
    implements _$$_DataSyncStateCopyWith<$Res> {
  __$$_DataSyncStateCopyWithImpl(
      _$_DataSyncState _value, $Res Function(_$_DataSyncState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookStates = null,
    Object? isDownloadingBooks = null,
    Object? booksInSync = null,
  }) {
    return _then(_$_DataSyncState(
      bookStates: null == bookStates
          ? _value._bookStates
          : bookStates // ignore: cast_nullable_to_non_nullable
              as List<BookSyncState>,
      isDownloadingBooks: null == isDownloadingBooks
          ? _value.isDownloadingBooks
          : isDownloadingBooks // ignore: cast_nullable_to_non_nullable
              as bool,
      booksInSync: null == booksInSync
          ? _value._booksInSync
          : booksInSync // ignore: cast_nullable_to_non_nullable
              as Set<int>,
    ));
  }
}

/// @nodoc

class _$_DataSyncState implements _DataSyncState {
  const _$_DataSyncState(
      {required final List<BookSyncState> bookStates,
      required this.isDownloadingBooks,
      required final Set<int> booksInSync})
      : _bookStates = bookStates,
        _booksInSync = booksInSync;

  final List<BookSyncState> _bookStates;
  @override
  List<BookSyncState> get bookStates {
    if (_bookStates is EqualUnmodifiableListView) return _bookStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bookStates);
  }

  @override
  final bool isDownloadingBooks;
  final Set<int> _booksInSync;
  @override
  Set<int> get booksInSync {
    if (_booksInSync is EqualUnmodifiableSetView) return _booksInSync;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_booksInSync);
  }

  @override
  String toString() {
    return 'DataSyncState(bookStates: $bookStates, isDownloadingBooks: $isDownloadingBooks, booksInSync: $booksInSync)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DataSyncState &&
            const DeepCollectionEquality()
                .equals(other._bookStates, _bookStates) &&
            (identical(other.isDownloadingBooks, isDownloadingBooks) ||
                other.isDownloadingBooks == isDownloadingBooks) &&
            const DeepCollectionEquality()
                .equals(other._booksInSync, _booksInSync));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookStates),
      isDownloadingBooks,
      const DeepCollectionEquality().hash(_booksInSync));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataSyncStateCopyWith<_$_DataSyncState> get copyWith =>
      __$$_DataSyncStateCopyWithImpl<_$_DataSyncState>(this, _$identity);
}

abstract class _DataSyncState implements DataSyncState {
  const factory _DataSyncState(
      {required final List<BookSyncState> bookStates,
      required final bool isDownloadingBooks,
      required final Set<int> booksInSync}) = _$_DataSyncState;

  @override
  List<BookSyncState> get bookStates;
  @override
  bool get isDownloadingBooks;
  @override
  Set<int> get booksInSync;
  @override
  @JsonKey(ignore: true)
  _$$_DataSyncStateCopyWith<_$_DataSyncState> get copyWith =>
      throw _privateConstructorUsedError;
}

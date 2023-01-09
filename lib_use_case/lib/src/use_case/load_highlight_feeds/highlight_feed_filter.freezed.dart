// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'highlight_feed_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HighlightFeedFilter {
  List<int>? get bookIds => throw _privateConstructorUsedError;
  List<String>? get authors => throw _privateConstructorUsedError;
  String? get searchTerm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HighlightFeedFilterCopyWith<HighlightFeedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HighlightFeedFilterCopyWith<$Res> {
  factory $HighlightFeedFilterCopyWith(
          HighlightFeedFilter value, $Res Function(HighlightFeedFilter) then) =
      _$HighlightFeedFilterCopyWithImpl<$Res, HighlightFeedFilter>;
  @useResult
  $Res call({List<int>? bookIds, List<String>? authors, String? searchTerm});
}

/// @nodoc
class _$HighlightFeedFilterCopyWithImpl<$Res, $Val extends HighlightFeedFilter>
    implements $HighlightFeedFilterCopyWith<$Res> {
  _$HighlightFeedFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookIds = freezed,
    Object? authors = freezed,
    Object? searchTerm = freezed,
  }) {
    return _then(_value.copyWith(
      bookIds: freezed == bookIds
          ? _value.bookIds
          : bookIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      authors: freezed == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_HighlightFeedFilterCopyWith<$Res>
    implements $HighlightFeedFilterCopyWith<$Res> {
  factory _$$_HighlightFeedFilterCopyWith(_$_HighlightFeedFilter value,
          $Res Function(_$_HighlightFeedFilter) then) =
      __$$_HighlightFeedFilterCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<int>? bookIds, List<String>? authors, String? searchTerm});
}

/// @nodoc
class __$$_HighlightFeedFilterCopyWithImpl<$Res>
    extends _$HighlightFeedFilterCopyWithImpl<$Res, _$_HighlightFeedFilter>
    implements _$$_HighlightFeedFilterCopyWith<$Res> {
  __$$_HighlightFeedFilterCopyWithImpl(_$_HighlightFeedFilter _value,
      $Res Function(_$_HighlightFeedFilter) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookIds = freezed,
    Object? authors = freezed,
    Object? searchTerm = freezed,
  }) {
    return _then(_$_HighlightFeedFilter(
      bookIds: freezed == bookIds
          ? _value._bookIds
          : bookIds // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      authors: freezed == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      searchTerm: freezed == searchTerm
          ? _value.searchTerm
          : searchTerm // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_HighlightFeedFilter implements _HighlightFeedFilter {
  const _$_HighlightFeedFilter(
      {final List<int>? bookIds, final List<String>? authors, this.searchTerm})
      : _bookIds = bookIds,
        _authors = authors;

  final List<int>? _bookIds;
  @override
  List<int>? get bookIds {
    final value = _bookIds;
    if (value == null) return null;
    if (_bookIds is EqualUnmodifiableListView) return _bookIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _authors;
  @override
  List<String>? get authors {
    final value = _authors;
    if (value == null) return null;
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? searchTerm;

  @override
  String toString() {
    return 'HighlightFeedFilter(bookIds: $bookIds, authors: $authors, searchTerm: $searchTerm)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HighlightFeedFilter &&
            const DeepCollectionEquality().equals(other._bookIds, _bookIds) &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.searchTerm, searchTerm) ||
                other.searchTerm == searchTerm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_bookIds),
      const DeepCollectionEquality().hash(_authors),
      searchTerm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HighlightFeedFilterCopyWith<_$_HighlightFeedFilter> get copyWith =>
      __$$_HighlightFeedFilterCopyWithImpl<_$_HighlightFeedFilter>(
          this, _$identity);
}

abstract class _HighlightFeedFilter implements HighlightFeedFilter {
  const factory _HighlightFeedFilter(
      {final List<int>? bookIds,
      final List<String>? authors,
      final String? searchTerm}) = _$_HighlightFeedFilter;

  @override
  List<int>? get bookIds;
  @override
  List<String>? get authors;
  @override
  String? get searchTerm;
  @override
  @JsonKey(ignore: true)
  _$$_HighlightFeedFilterCopyWith<_$_HighlightFeedFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

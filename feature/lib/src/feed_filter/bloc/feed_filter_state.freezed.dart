// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_filter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedFilterState {
  HighlightFeedFilter get filter => throw _privateConstructorUsedError;
  List<FeedFilterChip>? get chips => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedFilterStateCopyWith<FeedFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFilterStateCopyWith<$Res> {
  factory $FeedFilterStateCopyWith(
          FeedFilterState value, $Res Function(FeedFilterState) then) =
      _$FeedFilterStateCopyWithImpl<$Res, FeedFilterState>;
  @useResult
  $Res call({HighlightFeedFilter filter, List<FeedFilterChip>? chips});

  $HighlightFeedFilterCopyWith<$Res> get filter;
}

/// @nodoc
class _$FeedFilterStateCopyWithImpl<$Res, $Val extends FeedFilterState>
    implements $FeedFilterStateCopyWith<$Res> {
  _$FeedFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? chips = freezed,
  }) {
    return _then(_value.copyWith(
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as HighlightFeedFilter,
      chips: freezed == chips
          ? _value.chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<FeedFilterChip>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HighlightFeedFilterCopyWith<$Res> get filter {
    return $HighlightFeedFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedFilterStateCopyWith<$Res>
    implements $FeedFilterStateCopyWith<$Res> {
  factory _$$_FeedFilterStateCopyWith(
          _$_FeedFilterState value, $Res Function(_$_FeedFilterState) then) =
      __$$_FeedFilterStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HighlightFeedFilter filter, List<FeedFilterChip>? chips});

  @override
  $HighlightFeedFilterCopyWith<$Res> get filter;
}

/// @nodoc
class __$$_FeedFilterStateCopyWithImpl<$Res>
    extends _$FeedFilterStateCopyWithImpl<$Res, _$_FeedFilterState>
    implements _$$_FeedFilterStateCopyWith<$Res> {
  __$$_FeedFilterStateCopyWithImpl(
      _$_FeedFilterState _value, $Res Function(_$_FeedFilterState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = null,
    Object? chips = freezed,
  }) {
    return _then(_$_FeedFilterState(
      null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as HighlightFeedFilter,
      chips: freezed == chips
          ? _value._chips
          : chips // ignore: cast_nullable_to_non_nullable
              as List<FeedFilterChip>?,
    ));
  }
}

/// @nodoc

class _$_FeedFilterState implements _FeedFilterState {
  const _$_FeedFilterState(this.filter, {final List<FeedFilterChip>? chips})
      : _chips = chips;

  @override
  final HighlightFeedFilter filter;
  final List<FeedFilterChip>? _chips;
  @override
  List<FeedFilterChip>? get chips {
    final value = _chips;
    if (value == null) return null;
    if (_chips is EqualUnmodifiableListView) return _chips;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FeedFilterState(filter: $filter, chips: $chips)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedFilterState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            const DeepCollectionEquality().equals(other._chips, _chips));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, filter, const DeepCollectionEquality().hash(_chips));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedFilterStateCopyWith<_$_FeedFilterState> get copyWith =>
      __$$_FeedFilterStateCopyWithImpl<_$_FeedFilterState>(this, _$identity);
}

abstract class _FeedFilterState implements FeedFilterState {
  const factory _FeedFilterState(final HighlightFeedFilter filter,
      {final List<FeedFilterChip>? chips}) = _$_FeedFilterState;

  @override
  HighlightFeedFilter get filter;
  @override
  List<FeedFilterChip>? get chips;
  @override
  @JsonKey(ignore: true)
  _$$_FeedFilterStateCopyWith<_$_FeedFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

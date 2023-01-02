// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_filter_chip.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FeedFilterChip {
  FeedFilterType get type => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedFilterChipCopyWith<FeedFilterChip> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedFilterChipCopyWith<$Res> {
  factory $FeedFilterChipCopyWith(
          FeedFilterChip value, $Res Function(FeedFilterChip) then) =
      _$FeedFilterChipCopyWithImpl<$Res, FeedFilterChip>;
  @useResult
  $Res call({FeedFilterType type, String content, int? id});
}

/// @nodoc
class _$FeedFilterChipCopyWithImpl<$Res, $Val extends FeedFilterChip>
    implements $FeedFilterChipCopyWith<$Res> {
  _$FeedFilterChipCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedFilterType,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FeedFilterChipCopyWith<$Res>
    implements $FeedFilterChipCopyWith<$Res> {
  factory _$$_FeedFilterChipCopyWith(
          _$_FeedFilterChip value, $Res Function(_$_FeedFilterChip) then) =
      __$$_FeedFilterChipCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({FeedFilterType type, String content, int? id});
}

/// @nodoc
class __$$_FeedFilterChipCopyWithImpl<$Res>
    extends _$FeedFilterChipCopyWithImpl<$Res, _$_FeedFilterChip>
    implements _$$_FeedFilterChipCopyWith<$Res> {
  __$$_FeedFilterChipCopyWithImpl(
      _$_FeedFilterChip _value, $Res Function(_$_FeedFilterChip) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? content = null,
    Object? id = freezed,
  }) {
    return _then(_$_FeedFilterChip(
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as FeedFilterType,
      null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_FeedFilterChip implements _FeedFilterChip {
  const _$_FeedFilterChip(this.type, this.content, {this.id});

  @override
  final FeedFilterType type;
  @override
  final String content;
  @override
  final int? id;

  @override
  String toString() {
    return 'FeedFilterChip(type: $type, content: $content, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedFilterChip &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, type, content, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedFilterChipCopyWith<_$_FeedFilterChip> get copyWith =>
      __$$_FeedFilterChipCopyWithImpl<_$_FeedFilterChip>(this, _$identity);
}

abstract class _FeedFilterChip implements FeedFilterChip {
  const factory _FeedFilterChip(final FeedFilterType type, final String content,
      {final int? id}) = _$_FeedFilterChip;

  @override
  FeedFilterType get type;
  @override
  String get content;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_FeedFilterChipCopyWith<_$_FeedFilterChip> get copyWith =>
      throw _privateConstructorUsedError;
}

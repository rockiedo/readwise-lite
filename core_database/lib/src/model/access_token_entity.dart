import 'package:json_annotation/json_annotation.dart';

part 'access_token_entity.g.dart';

@JsonSerializable()
class AccessTokenEntity {
  @JsonKey(name: 'token')
  final String token;
  @JsonKey(name: 'is_active')
  final bool isActive;

  const AccessTokenEntity({
    required this.token,
    required this.isActive,
  });

  factory AccessTokenEntity.fromJson(Map<String, dynamic> json) => _$AccessTokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AccessTokenEntityToJson(this);
}

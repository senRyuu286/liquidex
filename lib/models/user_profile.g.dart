// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
  id: json['id'] as String,
  username: json['username'] as String,
  description: json['description'] as String?,
  hydrationTargetMl: (json['hydrationTargetMl'] as num?)?.toDouble() ?? 2500,
  dailySugarLimitGrams:
      (json['dailySugarLimitGrams'] as num?)?.toDouble() ?? 50,
  dailyCaffeineLimitMg:
      (json['dailyCaffeineLimitMg'] as num?)?.toDouble() ?? 400,
);

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'description': instance.description,
      'hydrationTargetMl': instance.hydrationTargetMl,
      'dailySugarLimitGrams': instance.dailySugarLimitGrams,
      'dailyCaffeineLimitMg': instance.dailyCaffeineLimitMg,
    };

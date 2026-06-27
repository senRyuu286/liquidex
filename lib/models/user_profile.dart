import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String id, 
    required String username,
    String? description,
    @Default(2500) double hydrationTargetMl,
    @Default(50) double dailySugarLimitGrams,
    @Default(400) double dailyCaffeineLimitMg,
  }) = _UserProfile;

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);
}
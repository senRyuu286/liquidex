// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfile {

 String get id; String get username; String? get description; double get hydrationTargetMl; double get dailySugarLimitGrams; double get dailyCaffeineLimitMg;
/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserProfileCopyWith<UserProfile> get copyWith => _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.description, description) || other.description == description)&&(identical(other.hydrationTargetMl, hydrationTargetMl) || other.hydrationTargetMl == hydrationTargetMl)&&(identical(other.dailySugarLimitGrams, dailySugarLimitGrams) || other.dailySugarLimitGrams == dailySugarLimitGrams)&&(identical(other.dailyCaffeineLimitMg, dailyCaffeineLimitMg) || other.dailyCaffeineLimitMg == dailyCaffeineLimitMg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,description,hydrationTargetMl,dailySugarLimitGrams,dailyCaffeineLimitMg);

@override
String toString() {
  return 'UserProfile(id: $id, username: $username, description: $description, hydrationTargetMl: $hydrationTargetMl, dailySugarLimitGrams: $dailySugarLimitGrams, dailyCaffeineLimitMg: $dailyCaffeineLimitMg)';
}


}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res>  {
  factory $UserProfileCopyWith(UserProfile value, $Res Function(UserProfile) _then) = _$UserProfileCopyWithImpl;
@useResult
$Res call({
 String id, String username, String? description, double hydrationTargetMl, double dailySugarLimitGrams, double dailyCaffeineLimitMg
});




}
/// @nodoc
class _$UserProfileCopyWithImpl<$Res>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = null,Object? description = freezed,Object? hydrationTargetMl = null,Object? dailySugarLimitGrams = null,Object? dailyCaffeineLimitMg = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,hydrationTargetMl: null == hydrationTargetMl ? _self.hydrationTargetMl : hydrationTargetMl // ignore: cast_nullable_to_non_nullable
as double,dailySugarLimitGrams: null == dailySugarLimitGrams ? _self.dailySugarLimitGrams : dailySugarLimitGrams // ignore: cast_nullable_to_non_nullable
as double,dailyCaffeineLimitMg: null == dailyCaffeineLimitMg ? _self.dailyCaffeineLimitMg : dailyCaffeineLimitMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UserProfile].
extension UserProfilePatterns on UserProfile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserProfile value)  $default,){
final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String username,  String? description,  double hydrationTargetMl,  double dailySugarLimitGrams,  double dailyCaffeineLimitMg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.username,_that.description,_that.hydrationTargetMl,_that.dailySugarLimitGrams,_that.dailyCaffeineLimitMg);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String username,  String? description,  double hydrationTargetMl,  double dailySugarLimitGrams,  double dailyCaffeineLimitMg)  $default,) {final _that = this;
switch (_that) {
case _UserProfile():
return $default(_that.id,_that.username,_that.description,_that.hydrationTargetMl,_that.dailySugarLimitGrams,_that.dailyCaffeineLimitMg);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String username,  String? description,  double hydrationTargetMl,  double dailySugarLimitGrams,  double dailyCaffeineLimitMg)?  $default,) {final _that = this;
switch (_that) {
case _UserProfile() when $default != null:
return $default(_that.id,_that.username,_that.description,_that.hydrationTargetMl,_that.dailySugarLimitGrams,_that.dailyCaffeineLimitMg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserProfile implements UserProfile {
  const _UserProfile({required this.id, required this.username, this.description, this.hydrationTargetMl = 2500, this.dailySugarLimitGrams = 50, this.dailyCaffeineLimitMg = 400});
  factory _UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

@override final  String id;
@override final  String username;
@override final  String? description;
@override@JsonKey() final  double hydrationTargetMl;
@override@JsonKey() final  double dailySugarLimitGrams;
@override@JsonKey() final  double dailyCaffeineLimitMg;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserProfileCopyWith<_UserProfile> get copyWith => __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.description, description) || other.description == description)&&(identical(other.hydrationTargetMl, hydrationTargetMl) || other.hydrationTargetMl == hydrationTargetMl)&&(identical(other.dailySugarLimitGrams, dailySugarLimitGrams) || other.dailySugarLimitGrams == dailySugarLimitGrams)&&(identical(other.dailyCaffeineLimitMg, dailyCaffeineLimitMg) || other.dailyCaffeineLimitMg == dailyCaffeineLimitMg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,description,hydrationTargetMl,dailySugarLimitGrams,dailyCaffeineLimitMg);

@override
String toString() {
  return 'UserProfile(id: $id, username: $username, description: $description, hydrationTargetMl: $hydrationTargetMl, dailySugarLimitGrams: $dailySugarLimitGrams, dailyCaffeineLimitMg: $dailyCaffeineLimitMg)';
}


}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res> implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(_UserProfile value, $Res Function(_UserProfile) _then) = __$UserProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String username, String? description, double hydrationTargetMl, double dailySugarLimitGrams, double dailyCaffeineLimitMg
});




}
/// @nodoc
class __$UserProfileCopyWithImpl<$Res>
    implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

/// Create a copy of UserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = null,Object? description = freezed,Object? hydrationTargetMl = null,Object? dailySugarLimitGrams = null,Object? dailyCaffeineLimitMg = null,}) {
  return _then(_UserProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: null == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,hydrationTargetMl: null == hydrationTargetMl ? _self.hydrationTargetMl : hydrationTargetMl // ignore: cast_nullable_to_non_nullable
as double,dailySugarLimitGrams: null == dailySugarLimitGrams ? _self.dailySugarLimitGrams : dailySugarLimitGrams // ignore: cast_nullable_to_non_nullable
as double,dailyCaffeineLimitMg: null == dailyCaffeineLimitMg ? _self.dailyCaffeineLimitMg : dailyCaffeineLimitMg // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on

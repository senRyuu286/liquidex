// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'drink_log_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrinkLogEntry {

 String get id;@TimestampConverter() DateTime get timestamp; String get indexLabel; BeverageCategory get category; double get volumeMl; double get caffeineMg; double get sugarGrams; String? get note;
/// Create a copy of DrinkLogEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrinkLogEntryCopyWith<DrinkLogEntry> get copyWith => _$DrinkLogEntryCopyWithImpl<DrinkLogEntry>(this as DrinkLogEntry, _$identity);

  /// Serializes this DrinkLogEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrinkLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.indexLabel, indexLabel) || other.indexLabel == indexLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.volumeMl, volumeMl) || other.volumeMl == volumeMl)&&(identical(other.caffeineMg, caffeineMg) || other.caffeineMg == caffeineMg)&&(identical(other.sugarGrams, sugarGrams) || other.sugarGrams == sugarGrams)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,indexLabel,category,volumeMl,caffeineMg,sugarGrams,note);

@override
String toString() {
  return 'DrinkLogEntry(id: $id, timestamp: $timestamp, indexLabel: $indexLabel, category: $category, volumeMl: $volumeMl, caffeineMg: $caffeineMg, sugarGrams: $sugarGrams, note: $note)';
}


}

/// @nodoc
abstract mixin class $DrinkLogEntryCopyWith<$Res>  {
  factory $DrinkLogEntryCopyWith(DrinkLogEntry value, $Res Function(DrinkLogEntry) _then) = _$DrinkLogEntryCopyWithImpl;
@useResult
$Res call({
 String id,@TimestampConverter() DateTime timestamp, String indexLabel, BeverageCategory category, double volumeMl, double caffeineMg, double sugarGrams, String? note
});




}
/// @nodoc
class _$DrinkLogEntryCopyWithImpl<$Res>
    implements $DrinkLogEntryCopyWith<$Res> {
  _$DrinkLogEntryCopyWithImpl(this._self, this._then);

  final DrinkLogEntry _self;
  final $Res Function(DrinkLogEntry) _then;

/// Create a copy of DrinkLogEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timestamp = null,Object? indexLabel = null,Object? category = null,Object? volumeMl = null,Object? caffeineMg = null,Object? sugarGrams = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,indexLabel: null == indexLabel ? _self.indexLabel : indexLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,volumeMl: null == volumeMl ? _self.volumeMl : volumeMl // ignore: cast_nullable_to_non_nullable
as double,caffeineMg: null == caffeineMg ? _self.caffeineMg : caffeineMg // ignore: cast_nullable_to_non_nullable
as double,sugarGrams: null == sugarGrams ? _self.sugarGrams : sugarGrams // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DrinkLogEntry].
extension DrinkLogEntryPatterns on DrinkLogEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DrinkLogEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DrinkLogEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DrinkLogEntry value)  $default,){
final _that = this;
switch (_that) {
case _DrinkLogEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DrinkLogEntry value)?  $default,){
final _that = this;
switch (_that) {
case _DrinkLogEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @TimestampConverter()  DateTime timestamp,  String indexLabel,  BeverageCategory category,  double volumeMl,  double caffeineMg,  double sugarGrams,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DrinkLogEntry() when $default != null:
return $default(_that.id,_that.timestamp,_that.indexLabel,_that.category,_that.volumeMl,_that.caffeineMg,_that.sugarGrams,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @TimestampConverter()  DateTime timestamp,  String indexLabel,  BeverageCategory category,  double volumeMl,  double caffeineMg,  double sugarGrams,  String? note)  $default,) {final _that = this;
switch (_that) {
case _DrinkLogEntry():
return $default(_that.id,_that.timestamp,_that.indexLabel,_that.category,_that.volumeMl,_that.caffeineMg,_that.sugarGrams,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @TimestampConverter()  DateTime timestamp,  String indexLabel,  BeverageCategory category,  double volumeMl,  double caffeineMg,  double sugarGrams,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _DrinkLogEntry() when $default != null:
return $default(_that.id,_that.timestamp,_that.indexLabel,_that.category,_that.volumeMl,_that.caffeineMg,_that.sugarGrams,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DrinkLogEntry implements DrinkLogEntry {
  const _DrinkLogEntry({required this.id, @TimestampConverter() required this.timestamp, required this.indexLabel, required this.category, required this.volumeMl, this.caffeineMg = 0, this.sugarGrams = 0, this.note});
  factory _DrinkLogEntry.fromJson(Map<String, dynamic> json) => _$DrinkLogEntryFromJson(json);

@override final  String id;
@override@TimestampConverter() final  DateTime timestamp;
@override final  String indexLabel;
@override final  BeverageCategory category;
@override final  double volumeMl;
@override@JsonKey() final  double caffeineMg;
@override@JsonKey() final  double sugarGrams;
@override final  String? note;

/// Create a copy of DrinkLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DrinkLogEntryCopyWith<_DrinkLogEntry> get copyWith => __$DrinkLogEntryCopyWithImpl<_DrinkLogEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DrinkLogEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DrinkLogEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.indexLabel, indexLabel) || other.indexLabel == indexLabel)&&(identical(other.category, category) || other.category == category)&&(identical(other.volumeMl, volumeMl) || other.volumeMl == volumeMl)&&(identical(other.caffeineMg, caffeineMg) || other.caffeineMg == caffeineMg)&&(identical(other.sugarGrams, sugarGrams) || other.sugarGrams == sugarGrams)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timestamp,indexLabel,category,volumeMl,caffeineMg,sugarGrams,note);

@override
String toString() {
  return 'DrinkLogEntry(id: $id, timestamp: $timestamp, indexLabel: $indexLabel, category: $category, volumeMl: $volumeMl, caffeineMg: $caffeineMg, sugarGrams: $sugarGrams, note: $note)';
}


}

/// @nodoc
abstract mixin class _$DrinkLogEntryCopyWith<$Res> implements $DrinkLogEntryCopyWith<$Res> {
  factory _$DrinkLogEntryCopyWith(_DrinkLogEntry value, $Res Function(_DrinkLogEntry) _then) = __$DrinkLogEntryCopyWithImpl;
@override @useResult
$Res call({
 String id,@TimestampConverter() DateTime timestamp, String indexLabel, BeverageCategory category, double volumeMl, double caffeineMg, double sugarGrams, String? note
});




}
/// @nodoc
class __$DrinkLogEntryCopyWithImpl<$Res>
    implements _$DrinkLogEntryCopyWith<$Res> {
  __$DrinkLogEntryCopyWithImpl(this._self, this._then);

  final _DrinkLogEntry _self;
  final $Res Function(_DrinkLogEntry) _then;

/// Create a copy of DrinkLogEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timestamp = null,Object? indexLabel = null,Object? category = null,Object? volumeMl = null,Object? caffeineMg = null,Object? sugarGrams = null,Object? note = freezed,}) {
  return _then(_DrinkLogEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,indexLabel: null == indexLabel ? _self.indexLabel : indexLabel // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,volumeMl: null == volumeMl ? _self.volumeMl : volumeMl // ignore: cast_nullable_to_non_nullable
as double,caffeineMg: null == caffeineMg ? _self.caffeineMg : caffeineMg // ignore: cast_nullable_to_non_nullable
as double,sugarGrams: null == sugarGrams ? _self.sugarGrams : sugarGrams // ignore: cast_nullable_to_non_nullable
as double,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

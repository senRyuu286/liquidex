// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'beverage_blueprint.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
BeverageBlueprint _$BeverageBlueprintFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'water':
          return Water.fromJson(
            json
          );
                case 'isotonic':
          return Isotonic.fromJson(
            json
          );
                case 'softDrink':
          return SoftDrink.fromJson(
            json
          );
                case 'naturalJuice':
          return NaturalJuice.fromJson(
            json
          );
                case 'energyDrink':
          return EnergyDrink.fromJson(
            json
          );
                case 'caffeineDrink':
          return CaffeineDrink.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'BeverageBlueprint',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$BeverageBlueprint {

 String get entryNumber; String get label; BeverageCategory get category; ImpactLevel get hydrationImpact; ImpactLevel get sugarImpact; ImpactLevel get caffeineImpact;
/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BeverageBlueprintCopyWith<BeverageBlueprint> get copyWith => _$BeverageBlueprintCopyWithImpl<BeverageBlueprint>(this as BeverageBlueprint, _$identity);

  /// Serializes this BeverageBlueprint to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeverageBlueprint&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact);

@override
String toString() {
  return 'BeverageBlueprint(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact)';
}


}

/// @nodoc
abstract mixin class $BeverageBlueprintCopyWith<$Res>  {
  factory $BeverageBlueprintCopyWith(BeverageBlueprint value, $Res Function(BeverageBlueprint) _then) = _$BeverageBlueprintCopyWithImpl;
@useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact
});




}
/// @nodoc
class _$BeverageBlueprintCopyWithImpl<$Res>
    implements $BeverageBlueprintCopyWith<$Res> {
  _$BeverageBlueprintCopyWithImpl(this._self, this._then);

  final BeverageBlueprint _self;
  final $Res Function(BeverageBlueprint) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,}) {
  return _then(_self.copyWith(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,
  ));
}

}


/// Adds pattern-matching-related methods to [BeverageBlueprint].
extension BeverageBlueprintPatterns on BeverageBlueprint {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( Water value)?  water,TResult Function( Isotonic value)?  isotonic,TResult Function( SoftDrink value)?  softDrink,TResult Function( NaturalJuice value)?  naturalJuice,TResult Function( EnergyDrink value)?  energyDrink,TResult Function( CaffeineDrink value)?  caffeineDrink,required TResult orElse(),}){
final _that = this;
switch (_that) {
case Water() when water != null:
return water(_that);case Isotonic() when isotonic != null:
return isotonic(_that);case SoftDrink() when softDrink != null:
return softDrink(_that);case NaturalJuice() when naturalJuice != null:
return naturalJuice(_that);case EnergyDrink() when energyDrink != null:
return energyDrink(_that);case CaffeineDrink() when caffeineDrink != null:
return caffeineDrink(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( Water value)  water,required TResult Function( Isotonic value)  isotonic,required TResult Function( SoftDrink value)  softDrink,required TResult Function( NaturalJuice value)  naturalJuice,required TResult Function( EnergyDrink value)  energyDrink,required TResult Function( CaffeineDrink value)  caffeineDrink,}){
final _that = this;
switch (_that) {
case Water():
return water(_that);case Isotonic():
return isotonic(_that);case SoftDrink():
return softDrink(_that);case NaturalJuice():
return naturalJuice(_that);case EnergyDrink():
return energyDrink(_that);case CaffeineDrink():
return caffeineDrink(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( Water value)?  water,TResult? Function( Isotonic value)?  isotonic,TResult? Function( SoftDrink value)?  softDrink,TResult? Function( NaturalJuice value)?  naturalJuice,TResult? Function( EnergyDrink value)?  energyDrink,TResult? Function( CaffeineDrink value)?  caffeineDrink,}){
final _that = this;
switch (_that) {
case Water() when water != null:
return water(_that);case Isotonic() when isotonic != null:
return isotonic(_that);case SoftDrink() when softDrink != null:
return softDrink(_that);case NaturalJuice() when naturalJuice != null:
return naturalJuice(_that);case EnergyDrink() when energyDrink != null:
return energyDrink(_that);case CaffeineDrink() when caffeineDrink != null:
return caffeineDrink(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  water,TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool electrolyteFlag)?  isotonic,TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  softDrink,TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  naturalJuice,TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  energyDrink,TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool hasSugarToggle)?  caffeineDrink,required TResult orElse(),}) {final _that = this;
switch (_that) {
case Water() when water != null:
return water(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case Isotonic() when isotonic != null:
return isotonic(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.electrolyteFlag);case SoftDrink() when softDrink != null:
return softDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case NaturalJuice() when naturalJuice != null:
return naturalJuice(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case EnergyDrink() when energyDrink != null:
return energyDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case CaffeineDrink() when caffeineDrink != null:
return caffeineDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.hasSugarToggle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)  water,required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool electrolyteFlag)  isotonic,required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)  softDrink,required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)  naturalJuice,required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)  energyDrink,required TResult Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool hasSugarToggle)  caffeineDrink,}) {final _that = this;
switch (_that) {
case Water():
return water(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case Isotonic():
return isotonic(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.electrolyteFlag);case SoftDrink():
return softDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case NaturalJuice():
return naturalJuice(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case EnergyDrink():
return energyDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case CaffeineDrink():
return caffeineDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.hasSugarToggle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  water,TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool electrolyteFlag)?  isotonic,TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  softDrink,TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  naturalJuice,TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact)?  energyDrink,TResult? Function( String entryNumber,  String label,  BeverageCategory category,  ImpactLevel hydrationImpact,  ImpactLevel sugarImpact,  ImpactLevel caffeineImpact,  bool hasSugarToggle)?  caffeineDrink,}) {final _that = this;
switch (_that) {
case Water() when water != null:
return water(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case Isotonic() when isotonic != null:
return isotonic(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.electrolyteFlag);case SoftDrink() when softDrink != null:
return softDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case NaturalJuice() when naturalJuice != null:
return naturalJuice(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case EnergyDrink() when energyDrink != null:
return energyDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact);case CaffeineDrink() when caffeineDrink != null:
return caffeineDrink(_that.entryNumber,_that.label,_that.category,_that.hydrationImpact,_that.sugarImpact,_that.caffeineImpact,_that.hasSugarToggle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class Water implements BeverageBlueprint {
  const Water({this.entryNumber = 'Entry #001', this.label = 'Pure H2O', this.category = BeverageCategory.water, this.hydrationImpact = ImpactLevel.full, this.sugarImpact = ImpactLevel.none, this.caffeineImpact = ImpactLevel.none, final  String? $type}): $type = $type ?? 'water';
  factory Water.fromJson(Map<String, dynamic> json) => _$WaterFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WaterCopyWith<Water> get copyWith => _$WaterCopyWithImpl<Water>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WaterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Water&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact);

@override
String toString() {
  return 'BeverageBlueprint.water(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact)';
}


}

/// @nodoc
abstract mixin class $WaterCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $WaterCopyWith(Water value, $Res Function(Water) _then) = _$WaterCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact
});




}
/// @nodoc
class _$WaterCopyWithImpl<$Res>
    implements $WaterCopyWith<$Res> {
  _$WaterCopyWithImpl(this._self, this._then);

  final Water _self;
  final $Res Function(Water) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,}) {
  return _then(Water(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,
  ));
}


}

/// @nodoc
@JsonSerializable()

class Isotonic implements BeverageBlueprint {
  const Isotonic({this.entryNumber = 'Entry #012', this.label = 'Hydro-Fuel', this.category = BeverageCategory.isotonic, this.hydrationImpact = ImpactLevel.partial, this.sugarImpact = ImpactLevel.full, this.caffeineImpact = ImpactLevel.none, this.electrolyteFlag = true, final  String? $type}): $type = $type ?? 'isotonic';
  factory Isotonic.fromJson(Map<String, dynamic> json) => _$IsotonicFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;
@JsonKey() final  bool electrolyteFlag;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsotonicCopyWith<Isotonic> get copyWith => _$IsotonicCopyWithImpl<Isotonic>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IsotonicToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Isotonic&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact)&&(identical(other.electrolyteFlag, electrolyteFlag) || other.electrolyteFlag == electrolyteFlag));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact,electrolyteFlag);

@override
String toString() {
  return 'BeverageBlueprint.isotonic(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact, electrolyteFlag: $electrolyteFlag)';
}


}

/// @nodoc
abstract mixin class $IsotonicCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $IsotonicCopyWith(Isotonic value, $Res Function(Isotonic) _then) = _$IsotonicCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact, bool electrolyteFlag
});




}
/// @nodoc
class _$IsotonicCopyWithImpl<$Res>
    implements $IsotonicCopyWith<$Res> {
  _$IsotonicCopyWithImpl(this._self, this._then);

  final Isotonic _self;
  final $Res Function(Isotonic) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,Object? electrolyteFlag = null,}) {
  return _then(Isotonic(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,electrolyteFlag: null == electrolyteFlag ? _self.electrolyteFlag : electrolyteFlag // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
@JsonSerializable()

class SoftDrink implements BeverageBlueprint {
  const SoftDrink({this.entryNumber = 'Entry #035', this.label = 'Sugar Bomb', this.category = BeverageCategory.softDrink, this.hydrationImpact = ImpactLevel.none, this.sugarImpact = ImpactLevel.full, this.caffeineImpact = ImpactLevel.none, final  String? $type}): $type = $type ?? 'softDrink';
  factory SoftDrink.fromJson(Map<String, dynamic> json) => _$SoftDrinkFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SoftDrinkCopyWith<SoftDrink> get copyWith => _$SoftDrinkCopyWithImpl<SoftDrink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SoftDrinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SoftDrink&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact);

@override
String toString() {
  return 'BeverageBlueprint.softDrink(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact)';
}


}

/// @nodoc
abstract mixin class $SoftDrinkCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $SoftDrinkCopyWith(SoftDrink value, $Res Function(SoftDrink) _then) = _$SoftDrinkCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact
});




}
/// @nodoc
class _$SoftDrinkCopyWithImpl<$Res>
    implements $SoftDrinkCopyWith<$Res> {
  _$SoftDrinkCopyWithImpl(this._self, this._then);

  final SoftDrink _self;
  final $Res Function(SoftDrink) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,}) {
  return _then(SoftDrink(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,
  ));
}


}

/// @nodoc
@JsonSerializable()

class NaturalJuice implements BeverageBlueprint {
  const NaturalJuice({this.entryNumber = 'Entry #050', this.label = "Nature's Blend", this.category = BeverageCategory.naturalJuice, this.hydrationImpact = ImpactLevel.partial, this.sugarImpact = ImpactLevel.full, this.caffeineImpact = ImpactLevel.none, final  String? $type}): $type = $type ?? 'naturalJuice';
  factory NaturalJuice.fromJson(Map<String, dynamic> json) => _$NaturalJuiceFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NaturalJuiceCopyWith<NaturalJuice> get copyWith => _$NaturalJuiceCopyWithImpl<NaturalJuice>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NaturalJuiceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NaturalJuice&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact);

@override
String toString() {
  return 'BeverageBlueprint.naturalJuice(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact)';
}


}

/// @nodoc
abstract mixin class $NaturalJuiceCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $NaturalJuiceCopyWith(NaturalJuice value, $Res Function(NaturalJuice) _then) = _$NaturalJuiceCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact
});




}
/// @nodoc
class _$NaturalJuiceCopyWithImpl<$Res>
    implements $NaturalJuiceCopyWith<$Res> {
  _$NaturalJuiceCopyWithImpl(this._self, this._then);

  final NaturalJuice _self;
  final $Res Function(NaturalJuice) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,}) {
  return _then(NaturalJuice(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,
  ));
}


}

/// @nodoc
@JsonSerializable()

class EnergyDrink implements BeverageBlueprint {
  const EnergyDrink({this.entryNumber = 'Entry #077', this.label = 'Overdrive', this.category = BeverageCategory.energyDrink, this.hydrationImpact = ImpactLevel.none, this.sugarImpact = ImpactLevel.full, this.caffeineImpact = ImpactLevel.full, final  String? $type}): $type = $type ?? 'energyDrink';
  factory EnergyDrink.fromJson(Map<String, dynamic> json) => _$EnergyDrinkFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EnergyDrinkCopyWith<EnergyDrink> get copyWith => _$EnergyDrinkCopyWithImpl<EnergyDrink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EnergyDrinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EnergyDrink&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact);

@override
String toString() {
  return 'BeverageBlueprint.energyDrink(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact)';
}


}

/// @nodoc
abstract mixin class $EnergyDrinkCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $EnergyDrinkCopyWith(EnergyDrink value, $Res Function(EnergyDrink) _then) = _$EnergyDrinkCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact
});




}
/// @nodoc
class _$EnergyDrinkCopyWithImpl<$Res>
    implements $EnergyDrinkCopyWith<$Res> {
  _$EnergyDrinkCopyWithImpl(this._self, this._then);

  final EnergyDrink _self;
  final $Res Function(EnergyDrink) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,}) {
  return _then(EnergyDrink(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CaffeineDrink implements BeverageBlueprint {
  const CaffeineDrink({this.entryNumber = 'Entry #099', this.label = 'Focus Brew', this.category = BeverageCategory.caffeine, this.hydrationImpact = ImpactLevel.none, this.sugarImpact = ImpactLevel.none, this.caffeineImpact = ImpactLevel.full, this.hasSugarToggle = false, final  String? $type}): $type = $type ?? 'caffeineDrink';
  factory CaffeineDrink.fromJson(Map<String, dynamic> json) => _$CaffeineDrinkFromJson(json);

@override@JsonKey() final  String entryNumber;
@override@JsonKey() final  String label;
@override@JsonKey() final  BeverageCategory category;
@override@JsonKey() final  ImpactLevel hydrationImpact;
@override@JsonKey() final  ImpactLevel sugarImpact;
@override@JsonKey() final  ImpactLevel caffeineImpact;
@JsonKey() final  bool hasSugarToggle;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaffeineDrinkCopyWith<CaffeineDrink> get copyWith => _$CaffeineDrinkCopyWithImpl<CaffeineDrink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaffeineDrinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaffeineDrink&&(identical(other.entryNumber, entryNumber) || other.entryNumber == entryNumber)&&(identical(other.label, label) || other.label == label)&&(identical(other.category, category) || other.category == category)&&(identical(other.hydrationImpact, hydrationImpact) || other.hydrationImpact == hydrationImpact)&&(identical(other.sugarImpact, sugarImpact) || other.sugarImpact == sugarImpact)&&(identical(other.caffeineImpact, caffeineImpact) || other.caffeineImpact == caffeineImpact)&&(identical(other.hasSugarToggle, hasSugarToggle) || other.hasSugarToggle == hasSugarToggle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,entryNumber,label,category,hydrationImpact,sugarImpact,caffeineImpact,hasSugarToggle);

@override
String toString() {
  return 'BeverageBlueprint.caffeineDrink(entryNumber: $entryNumber, label: $label, category: $category, hydrationImpact: $hydrationImpact, sugarImpact: $sugarImpact, caffeineImpact: $caffeineImpact, hasSugarToggle: $hasSugarToggle)';
}


}

/// @nodoc
abstract mixin class $CaffeineDrinkCopyWith<$Res> implements $BeverageBlueprintCopyWith<$Res> {
  factory $CaffeineDrinkCopyWith(CaffeineDrink value, $Res Function(CaffeineDrink) _then) = _$CaffeineDrinkCopyWithImpl;
@override @useResult
$Res call({
 String entryNumber, String label, BeverageCategory category, ImpactLevel hydrationImpact, ImpactLevel sugarImpact, ImpactLevel caffeineImpact, bool hasSugarToggle
});




}
/// @nodoc
class _$CaffeineDrinkCopyWithImpl<$Res>
    implements $CaffeineDrinkCopyWith<$Res> {
  _$CaffeineDrinkCopyWithImpl(this._self, this._then);

  final CaffeineDrink _self;
  final $Res Function(CaffeineDrink) _then;

/// Create a copy of BeverageBlueprint
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? entryNumber = null,Object? label = null,Object? category = null,Object? hydrationImpact = null,Object? sugarImpact = null,Object? caffeineImpact = null,Object? hasSugarToggle = null,}) {
  return _then(CaffeineDrink(
entryNumber: null == entryNumber ? _self.entryNumber : entryNumber // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as BeverageCategory,hydrationImpact: null == hydrationImpact ? _self.hydrationImpact : hydrationImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,sugarImpact: null == sugarImpact ? _self.sugarImpact : sugarImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,caffeineImpact: null == caffeineImpact ? _self.caffeineImpact : caffeineImpact // ignore: cast_nullable_to_non_nullable
as ImpactLevel,hasSugarToggle: null == hasSugarToggle ? _self.hasSugarToggle : hasSugarToggle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

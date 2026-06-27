// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beverage_blueprint.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Water _$WaterFromJson(Map<String, dynamic> json) => Water(
  entryNumber: json['entryNumber'] as String? ?? 'Entry #001',
  label: json['label'] as String? ?? 'Pure H2O',
  category:
      $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
      BeverageCategory.water,
  hydrationImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
      ImpactLevel.full,
  sugarImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
      ImpactLevel.none,
  caffeineImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
      ImpactLevel.none,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$WaterToJson(Water instance) => <String, dynamic>{
  'entryNumber': instance.entryNumber,
  'label': instance.label,
  'category': _$BeverageCategoryEnumMap[instance.category]!,
  'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
  'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
  'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
  'runtimeType': instance.$type,
};

const _$BeverageCategoryEnumMap = {
  BeverageCategory.water: 'water',
  BeverageCategory.isotonic: 'isotonic',
  BeverageCategory.softDrink: 'soft_drink',
  BeverageCategory.naturalJuice: 'natural_juice',
  BeverageCategory.energyDrink: 'energy_drink',
  BeverageCategory.caffeine: 'caffeine',
};

const _$ImpactLevelEnumMap = {
  ImpactLevel.full: 'full',
  ImpactLevel.partial: 'partial',
  ImpactLevel.none: 'none',
};

Isotonic _$IsotonicFromJson(Map<String, dynamic> json) => Isotonic(
  entryNumber: json['entryNumber'] as String? ?? 'Entry #012',
  label: json['label'] as String? ?? 'Hydro-Fuel',
  category:
      $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
      BeverageCategory.isotonic,
  hydrationImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
      ImpactLevel.partial,
  sugarImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
      ImpactLevel.full,
  caffeineImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
      ImpactLevel.none,
  electrolyteFlag: json['electrolyteFlag'] as bool? ?? true,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$IsotonicToJson(Isotonic instance) => <String, dynamic>{
  'entryNumber': instance.entryNumber,
  'label': instance.label,
  'category': _$BeverageCategoryEnumMap[instance.category]!,
  'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
  'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
  'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
  'electrolyteFlag': instance.electrolyteFlag,
  'runtimeType': instance.$type,
};

SoftDrink _$SoftDrinkFromJson(Map<String, dynamic> json) => SoftDrink(
  entryNumber: json['entryNumber'] as String? ?? 'Entry #035',
  label: json['label'] as String? ?? 'Sugar Bomb',
  category:
      $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
      BeverageCategory.softDrink,
  hydrationImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
      ImpactLevel.none,
  sugarImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
      ImpactLevel.full,
  caffeineImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
      ImpactLevel.none,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$SoftDrinkToJson(SoftDrink instance) => <String, dynamic>{
  'entryNumber': instance.entryNumber,
  'label': instance.label,
  'category': _$BeverageCategoryEnumMap[instance.category]!,
  'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
  'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
  'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
  'runtimeType': instance.$type,
};

NaturalJuice _$NaturalJuiceFromJson(Map<String, dynamic> json) => NaturalJuice(
  entryNumber: json['entryNumber'] as String? ?? 'Entry #050',
  label: json['label'] as String? ?? "Nature's Blend",
  category:
      $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
      BeverageCategory.naturalJuice,
  hydrationImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
      ImpactLevel.partial,
  sugarImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
      ImpactLevel.full,
  caffeineImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
      ImpactLevel.none,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$NaturalJuiceToJson(NaturalJuice instance) =>
    <String, dynamic>{
      'entryNumber': instance.entryNumber,
      'label': instance.label,
      'category': _$BeverageCategoryEnumMap[instance.category]!,
      'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
      'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
      'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
      'runtimeType': instance.$type,
    };

EnergyDrink _$EnergyDrinkFromJson(Map<String, dynamic> json) => EnergyDrink(
  entryNumber: json['entryNumber'] as String? ?? 'Entry #077',
  label: json['label'] as String? ?? 'Overdrive',
  category:
      $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
      BeverageCategory.energyDrink,
  hydrationImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
      ImpactLevel.none,
  sugarImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
      ImpactLevel.full,
  caffeineImpact:
      $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
      ImpactLevel.full,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$EnergyDrinkToJson(EnergyDrink instance) =>
    <String, dynamic>{
      'entryNumber': instance.entryNumber,
      'label': instance.label,
      'category': _$BeverageCategoryEnumMap[instance.category]!,
      'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
      'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
      'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
      'runtimeType': instance.$type,
    };

CaffeineDrink _$CaffeineDrinkFromJson(Map<String, dynamic> json) =>
    CaffeineDrink(
      entryNumber: json['entryNumber'] as String? ?? 'Entry #099',
      label: json['label'] as String? ?? 'Focus Brew',
      category:
          $enumDecodeNullable(_$BeverageCategoryEnumMap, json['category']) ??
          BeverageCategory.caffeine,
      hydrationImpact:
          $enumDecodeNullable(_$ImpactLevelEnumMap, json['hydrationImpact']) ??
          ImpactLevel.none,
      sugarImpact:
          $enumDecodeNullable(_$ImpactLevelEnumMap, json['sugarImpact']) ??
          ImpactLevel.none,
      caffeineImpact:
          $enumDecodeNullable(_$ImpactLevelEnumMap, json['caffeineImpact']) ??
          ImpactLevel.full,
      hasSugarToggle: json['hasSugarToggle'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$CaffeineDrinkToJson(CaffeineDrink instance) =>
    <String, dynamic>{
      'entryNumber': instance.entryNumber,
      'label': instance.label,
      'category': _$BeverageCategoryEnumMap[instance.category]!,
      'hydrationImpact': _$ImpactLevelEnumMap[instance.hydrationImpact]!,
      'sugarImpact': _$ImpactLevelEnumMap[instance.sugarImpact]!,
      'caffeineImpact': _$ImpactLevelEnumMap[instance.caffeineImpact]!,
      'hasSugarToggle': instance.hasSugarToggle,
      'runtimeType': instance.$type,
    };

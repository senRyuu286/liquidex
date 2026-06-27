// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drink_log_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DrinkLogEntry _$DrinkLogEntryFromJson(Map<String, dynamic> json) =>
    _DrinkLogEntry(
      id: json['id'] as String,
      timestamp: const TimestampConverter().fromJson(
        json['timestamp'] as Timestamp,
      ),
      indexLabel: json['indexLabel'] as String,
      category: $enumDecode(_$BeverageCategoryEnumMap, json['category']),
      volumeMl: (json['volumeMl'] as num).toDouble(),
      caffeineMg: (json['caffeineMg'] as num?)?.toDouble() ?? 0,
      sugarGrams: (json['sugarGrams'] as num?)?.toDouble() ?? 0,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$DrinkLogEntryToJson(_DrinkLogEntry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'indexLabel': instance.indexLabel,
      'category': _$BeverageCategoryEnumMap[instance.category]!,
      'volumeMl': instance.volumeMl,
      'caffeineMg': instance.caffeineMg,
      'sugarGrams': instance.sugarGrams,
      'note': instance.note,
    };

const _$BeverageCategoryEnumMap = {
  BeverageCategory.water: 'water',
  BeverageCategory.isotonic: 'isotonic',
  BeverageCategory.softDrink: 'soft_drink',
  BeverageCategory.naturalJuice: 'natural_juice',
  BeverageCategory.energyDrink: 'energy_drink',
  BeverageCategory.caffeine: 'caffeine',
};

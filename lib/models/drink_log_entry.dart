import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'beverage_category.dart';

part 'drink_log_entry.freezed.dart';
part 'drink_log_entry.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate();

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

@freezed
abstract class DrinkLogEntry with _$DrinkLogEntry {
  const factory DrinkLogEntry({
    required String id,
    @TimestampConverter() required DateTime timestamp,
    required String indexLabel,
    required BeverageCategory category,
    required double volumeMl,
    @Default(0) double caffeineMg,
    @Default(0) double sugarGrams,
    String? note,
  }) = _DrinkLogEntry;

  factory DrinkLogEntry.fromJson(Map<String, dynamic> json) =>
      _$DrinkLogEntryFromJson(json);
}

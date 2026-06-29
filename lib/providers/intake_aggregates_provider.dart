import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/beverage_category.dart';
import '../models/drink_log_entry.dart';
import 'daily_beverage_stream_provider.dart';

part 'intake_aggregates_provider.g.dart';

/// Hydration contribution multiplier per category, mirroring each
/// category's default `hydrationImpact` in BeverageBlueprint.
const Map<BeverageCategory, double> hydrationMultiplierByCategory = {
  BeverageCategory.water: 1.0,
  BeverageCategory.isotonic: 0.5,
  BeverageCategory.softDrink: 0.0,
  BeverageCategory.naturalJuice: 0.5,
  BeverageCategory.energyDrink: 0.0,
  BeverageCategory.caffeine: 0.0,
};

double hydrationContributionMl(BeverageCategory category, double volumeMl) {
  return volumeMl * (hydrationMultiplierByCategory[category] ?? 0.0);
}

class IntakeAggregates {
  const IntakeAggregates({
    required this.totalHydrationMl,
    required this.totalSugarGrams,
    required this.totalCaffeineMg,
  });

  final double totalHydrationMl;
  final double totalSugarGrams;
  final double totalCaffeineMg;

  static const empty = IntakeAggregates(
    totalHydrationMl: 0,
    totalSugarGrams: 0,
    totalCaffeineMg: 0,
  );
}

@riverpod
IntakeAggregates intakeAggregates(Ref ref) {
  final List<DrinkLogEntry> logs =
      ref.watch(dailyBeverageStreamProvider).value ?? const <DrinkLogEntry>[];

  double hydration = 0;
  double sugar = 0;
  double caffeine = 0;

  for (final log in logs) {
    hydration += hydrationContributionMl(log.category, log.volumeMl);
    sugar += log.sugarGrams;
    caffeine += log.caffeineMg;
  }

  return IntakeAggregates(
    totalHydrationMl: hydration,
    totalSugarGrams: sugar,
    totalCaffeineMg: caffeine,
  );
}
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/beverage_category.dart';
import '../models/drink_log_entry.dart';
import '../models/user_profile.dart';
import '../providers/daily_beverage_stream_provider.dart';
import '../providers/intake_aggregates_provider.dart';
import '../providers/user_targets_provider.dart';

part 'data_view_model.g.dart';

class CategoryBreakdown {
  const CategoryBreakdown({required this.category, required this.totalMl});

  final BeverageCategory category;
  final double totalMl;
}

class DataViewModelState {
  const DataViewModelState({
    required this.hydrationCurrentMl,
    required this.hydrationTargetMl,
    required this.hydrationPercent,
    required this.sugarCurrentGrams,
    required this.sugarTargetGrams,
    required this.sugarPercent,
    required this.caffeineCurrentMg,
    required this.caffeineTargetMg,
    required this.caffeinePercent,
    required this.breakdown,
    required this.recentLogs,
  });

  final double hydrationCurrentMl;
  final double hydrationTargetMl;
  final double hydrationPercent;

  final double sugarCurrentGrams;
  final double sugarTargetGrams;
  final double sugarPercent;

  final double caffeineCurrentMg;
  final double caffeineTargetMg;
  final double caffeinePercent;

  final List<CategoryBreakdown> breakdown;
  final List<DrinkLogEntry> recentLogs;
}

const int _recentLogsLimit = 5;

double _percentOf(double current, double target) {
  if (target <= 0) return 0;
  return (current / target).clamp(0.0, 1.0);
}

@riverpod
DataViewModelState dataViewModel(Ref ref) {
  final List<DrinkLogEntry> entries =
      ref.watch(dailyBeverageStreamProvider).value ?? const <DrinkLogEntry>[];
  final aggregates = ref.watch(intakeAggregatesProvider);
  final targets =
      ref.watch(userTargetsProvider).value ??
      const UserProfile(id: '', username: '');

  final volumeByCategory = <BeverageCategory, double>{
    for (final category in BeverageCategory.values) category: 0,
  };
  for (final entry in entries) {
    volumeByCategory[entry.category] =
        (volumeByCategory[entry.category] ?? 0) + entry.volumeMl;
  }

  // Explicit element typing on the comparator removes any chance of
  // the analyzer inferring a nullable DrinkLogEntry?.
  final List<DrinkLogEntry> recentLogs = List<DrinkLogEntry>.of(entries)
    ..sort(
      (DrinkLogEntry a, DrinkLogEntry b) => b.timestamp.compareTo(a.timestamp),
    );

  return DataViewModelState(
    hydrationCurrentMl: aggregates.totalHydrationMl,
    hydrationTargetMl: targets.hydrationTargetMl,
    hydrationPercent: _percentOf(
      aggregates.totalHydrationMl,
      targets.hydrationTargetMl,
    ),
    sugarCurrentGrams: aggregates.totalSugarGrams,
    sugarTargetGrams: targets.dailySugarLimitGrams,
    sugarPercent: _percentOf(
      aggregates.totalSugarGrams,
      targets.dailySugarLimitGrams,
    ),
    caffeineCurrentMg: aggregates.totalCaffeineMg,
    caffeineTargetMg: targets.dailyCaffeineLimitMg,
    caffeinePercent: _percentOf(
      aggregates.totalCaffeineMg,
      targets.dailyCaffeineLimitMg,
    ),
    breakdown: BeverageCategory.values
        .map(
          (category) => CategoryBreakdown(
            category: category,
            totalMl: volumeByCategory[category] ?? 0,
          ),
        )
        .toList(),
    recentLogs: recentLogs.take(_recentLogsLimit).toList(),
  );
}

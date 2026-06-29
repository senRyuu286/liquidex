import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/drink_log_entry.dart';
import '../providers/intake_aggregates_provider.dart';
import '../providers/liquid_tracker_controller.dart';

part 'log_view_model.g.dart';

/// Time-ordered entries plus today's running totals, for the Log
/// Screen's timeline and totals footer.
class LogViewModelState {
  const LogViewModelState({
    required this.entries,
    required this.totalHydrationMl,
    required this.totalSugarGrams,
    required this.totalCaffeineMg,
  });

  /// Today's entries, oldest first.
  final List<DrinkLogEntry> entries;

  final double totalHydrationMl;
  final double totalSugarGrams;
  final double totalCaffeineMg;
}

/// Time-ordered list of today's entries plus a delete action, wired
/// to [LiquidTrackerController] for optimistic swipe-to-delete.
@riverpod
class LogViewModel extends _$LogViewModel {
  @override
  LogViewModelState build() {
    final entries = [...ref.watch(liquidTrackerControllerProvider)]
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
    final aggregates = ref.watch(intakeAggregatesProvider);

    return LogViewModelState(
      entries: entries,
      totalHydrationMl: aggregates.totalHydrationMl,
      totalSugarGrams: aggregates.totalSugarGrams,
      totalCaffeineMg: aggregates.totalCaffeineMg,
    );
  }

  Future<void> deleteEntry(String uuid) {
    return ref.read(liquidTrackerControllerProvider.notifier).deleteEntry(uuid);
  }
}

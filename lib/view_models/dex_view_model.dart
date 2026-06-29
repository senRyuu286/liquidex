import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models/beverage_blueprint.dart';
import '../models/beverage_category.dart';
import '../models/drink_log_entry.dart';
import '../models/user_profile.dart';
import '../providers/intake_aggregates_provider.dart';
import '../providers/liquid_tracker_controller.dart';
import '../providers/user_targets_provider.dart';
import '../utils/input_validators.dart';
import '../utils/warning_level.dart';

part 'dex_view_model.g.dart';

class DexCategorySlot {
  const DexCategorySlot({
    required this.category,
    required this.totalVolumeMl,
    required this.warningLevel,
    required this.hydrationGoalLevel,
  });

  final BeverageCategory category;
  final double totalVolumeMl;
  final WarningLevel? warningLevel;
  final HydrationGoalLevel? hydrationGoalLevel;
}

class DexViewModelState {
  const DexViewModelState({
    required this.categorySlots,
    required this.globalSummary,
    required this.hydrationGoalLevel,
    required this.ceilingJustBreached,
  });

  final List<DexCategorySlot> categorySlots;
  final IntakeAggregates globalSummary;
  final HydrationGoalLevel hydrationGoalLevel;

  /// True for exactly one rebuild: the one where overall sugar or
  /// caffeine intake crosses from not-exceeded into exceeded. The
  /// view should fire HapticFeedback.vibrate and then call
  /// [DexViewModel.acknowledgeBreach].
  final bool ceilingJustBreached;

  DexViewModelState copyWith({bool? ceilingJustBreached}) {
    return DexViewModelState(
      categorySlots: categorySlots,
      globalSummary: globalSummary,
      hydrationGoalLevel: hydrationGoalLevel,
      ceilingJustBreached: ceilingJustBreached ?? this.ceilingJustBreached,
    );
  }
}

/// Drives the Dex Screen grid: per-category aggregates and warning
/// levels, the global summary bar, breach detection for haptics, and
/// the FAB modal's submit action.
@riverpod
class DexViewModel extends _$DexViewModel {
  WarningLevel? _lastOverallLevel;

  @override
  DexViewModelState build() {
    // Optimistic source so the grid updates instantly on submit,
    // ahead of Firestore confirmation.
    final entries = ref.watch(liquidTrackerControllerProvider);
    final aggregates = ref.watch(intakeAggregatesProvider);
    final targets =
        ref.watch(userTargetsProvider).value ??
        const UserProfile(id: '', username: '');

    final sugarLevel = warningLevelFor(
      current: aggregates.totalSugarGrams,
      ceiling: targets.dailySugarLimitGrams,
    );
    final caffeineLevel = warningLevelFor(
      current: aggregates.totalCaffeineMg,
      ceiling: targets.dailyCaffeineLimitMg,
    );
    final overallLevel = _worstLevel(sugarLevel, caffeineLevel);

    final hydrationLevel = hydrationGoalLevelFor(
      current: aggregates.totalHydrationMl,
      goal: targets.hydrationTargetMl,
    );

    final volumeByCategory = <BeverageCategory, double>{
      for (final category in BeverageCategory.values) category: 0,
    };
    for (final entry in entries) {
      volumeByCategory[entry.category] =
          (volumeByCategory[entry.category] ?? 0) + entry.volumeMl;
    }

    final slots = BeverageCategory.values.map((category) {
      WarningLevel? warningLevel;
      HydrationGoalLevel? hydrationGoal;

      switch (category) {
        case BeverageCategory.water:
          hydrationGoal = hydrationLevel;
        case BeverageCategory.energyDrink:
          warningLevel = overallLevel;
        case BeverageCategory.caffeine:
          warningLevel = caffeineLevel;
        case BeverageCategory.isotonic:
        case BeverageCategory.softDrink:
        case BeverageCategory.naturalJuice:
          warningLevel = sugarLevel;
      }

      return DexCategorySlot(
        category: category,
        totalVolumeMl: volumeByCategory[category] ?? 0,
        warningLevel: warningLevel,
        hydrationGoalLevel: hydrationGoal,
      );
    }).toList();

    final justBreached =
        _lastOverallLevel != WarningLevel.exceeded &&
        overallLevel == WarningLevel.exceeded;
    _lastOverallLevel = overallLevel;

    return DexViewModelState(
      categorySlots: slots,
      globalSummary: aggregates,
      hydrationGoalLevel: hydrationLevel,
      ceilingJustBreached: justBreached,
    );
  }

  static WarningLevel _worstLevel(WarningLevel a, WarningLevel b) {
    const severity = {
      WarningLevel.withinLimit: 0,
      WarningLevel.approaching: 1,
      WarningLevel.exceeded: 2,
    };
    return severity[a]! >= severity[b]! ? a : b;
  }

  /// Resets [DexViewModelState.ceilingJustBreached] after the view has
  /// fired its haptic, so the same breach doesn't re-fire on the next
  /// unrelated rebuild.
  void acknowledgeBreach() {
    state = state.copyWith(ceilingJustBreached: false);
  }

  /// Validates and submits a new log entry from the FAB quick-log
  /// modal. Returns a validation error message, or `null` on success.
  Future<String?> submitEntry({
    required BeverageCategory category,
    required double volumeMl,
    double caffeineMg = 0,
    double sugarGrams = 0,
    String? note,
  }) async {
    final error = validateVolumeMl(volumeMl);
    if (error != null) return error;

    final entry = DrinkLogEntry(
      id: const Uuid().v4(),
      timestamp: DateTime.now(),
      indexLabel: _indexLabelFor(category),
      category: category,
      volumeMl: volumeMl,
      caffeineMg: caffeineMg,
      sugarGrams: sugarGrams,
      note: note,
    );

    await ref.read(liquidTrackerControllerProvider.notifier).addEntry(entry);
    return null;
  }

  String _indexLabelFor(BeverageCategory category) {
    final blueprint = switch (category) {
      BeverageCategory.water => const BeverageBlueprint.water(),
      BeverageCategory.isotonic => const BeverageBlueprint.isotonic(),
      BeverageCategory.softDrink => const BeverageBlueprint.softDrink(),
      BeverageCategory.naturalJuice => const BeverageBlueprint.naturalJuice(),
      BeverageCategory.energyDrink => const BeverageBlueprint.energyDrink(),
      BeverageCategory.caffeine => const BeverageBlueprint.caffeineDrink(),
    };
    return blueprint.entryNumber;
  }
}

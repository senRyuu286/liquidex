import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/category_presentation.dart';
import '../../utils/warning_level.dart';
import '../../view_models/dex_view_model.dart';

class DexScreen extends ConsumerStatefulWidget {
  const DexScreen({super.key});

  @override
  ConsumerState<DexScreen> createState() => _DexScreenState();
}

class _DexScreenState extends ConsumerState<DexScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    // Fire one haptic the instant overall sugar/caffeine crosses into
    // "exceeded", then clear the flag so it doesn't re-fire on
    // unrelated rebuilds.
    ref.listen<DexViewModelState>(dexViewModelProvider, (previous, next) {
      if (next.ceilingJustBreached) {
        HapticFeedback.vibrate();
        ref.read(dexViewModelProvider.notifier).acknowledgeBreach();
      }
    });

    final dexState = ref.watch(dexViewModelProvider);

    final entries = dexState.categorySlots.where((slot) {
      if (_query.isEmpty) return true;
      final query = _query.toLowerCase();
      final blueprint = blueprintFor(slot.category);
      return blueprint.label.toLowerCase().contains(query) ||
          categoryDisplayName(slot.category).toLowerCase().contains(query);
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => setState(() => _query = value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Catalog Blueprints...',
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: entries.isEmpty
                ? Center(
                    child: Text(
                      'No blueprints match "$_query".',
                      style: AppTextStyles.bodyMedium,
                    ),
                  )
                : ListView.separated(
                    itemCount: entries.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      return _BlueprintCard(slot: entries[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _BlueprintCard extends StatelessWidget {
  const _BlueprintCard({required this.slot});

  final DexCategorySlot slot;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final blueprint = blueprintFor(slot.category);
    final statusLabel = slot.hydrationGoalLevel != null
        ? _hydrationStatusLabel(slot.hydrationGoalLevel!)
        : _warningStatusLabel(slot.warningLevel!);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 80,
              child: Center(
                child: Text(
                  blueprint.entryNumber.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: AppTextStyles.entryIndex.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            VerticalDivider(color: dividerColor, width: 1, thickness: 1),
            Container(
              width: 56,
              height: 56,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: categoryAccentColor(slot.category),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Icon(
                  categoryIcon(slot.category),
                  color: theme.colorScheme.onPrimary,
                  size: 26,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      blueprint.label,
                      style: AppTextStyles.displaySmall.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Vol: ${slot.totalVolumeMl.round()}ml today | $statusLabel',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _warningStatusLabel(WarningLevel level) {
    switch (level) {
      case WarningLevel.withinLimit:
        return 'Within Limit';
      case WarningLevel.approaching:
        return 'Approaching';
      case WarningLevel.exceeded:
        return 'Exceeded';
    }
  }

  String _hydrationStatusLabel(HydrationGoalLevel level) {
    switch (level) {
      case HydrationGoalLevel.withinLimit:
        return 'In Progress';
      case HydrationGoalLevel.achieved:
        return 'Goal Reached';
    }
  }
}

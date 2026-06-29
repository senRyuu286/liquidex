// lib/screens/log/log_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/beverage_category.dart';
import '../../models/drink_log_entry.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/category_presentation.dart';
import '../../view_models/log_view_model.dart';

class LogScreen extends ConsumerWidget {
  const LogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(logViewModelProvider);
    final entries = state.entries;

    return Column(
      children: [
        Container(
          width: double.infinity,
          color: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Center(
            child: Text(
              'TIMELINE: TODAY',
              style: AppTextStyles.entryIndex.copyWith(
                color: theme.colorScheme.onPrimary,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        Expanded(
          child: entries.isEmpty
              ? Center(
                  child: Text(
                    'No drinks logged yet today.',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: entries.length,
                  itemBuilder: (context, index) {
                    final entry = entries[index];
                    final isLast = index == entries.length - 1;

                    return IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 24,
                            child: Column(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  color: categoryAccentColor(entry.category),
                                ),
                                if (!isLast)
                                  Expanded(
                                    child: Container(
                                      width: 2,
                                      color:
                                          theme.dividerTheme.color ??
                                          theme.colorScheme.outlineVariant,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Dismissible(
                              key: ValueKey(entry.id),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                  color: AppColors.dangerRed,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                              onDismissed: (_) => ref
                                  .read(logViewModelProvider.notifier)
                                  .deleteEntry(entry.id),
                              child: _LogEntryCard(entry: entry),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
        SafeArea(
          top: false,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: theme.dividerTheme.color ?? theme.colorScheme.outline,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _TotalRow(
                  label: 'TOTAL WATER: ${state.totalHydrationMl.round()}ml',
                ),
                const SizedBox(height: 6),
                _TotalRow(
                  label: 'TOTAL SUGAR: ${state.totalSugarGrams.round()}g',
                ),
                const SizedBox(height: 6),
                _TotalRow(
                  label: 'TOTAL CAFFEINE: ${state.totalCaffeineMg.round()}mg',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

List<String> _chipsFor(DrinkLogEntry entry) {
  final volumeChip = '${entry.volumeMl.round()} ml';
  switch (entry.category) {
    case BeverageCategory.water:
      return [volumeChip, 'Water Intake'];
    case BeverageCategory.caffeine:
      return [volumeChip, '+${entry.caffeineMg.round()}mg Caffeine'];
    case BeverageCategory.energyDrink:
      return [
        volumeChip,
        '+${entry.caffeineMg.round()}mg Caffeine',
        '+${entry.sugarGrams.round()}g Sugar',
      ];
    case BeverageCategory.isotonic:
    case BeverageCategory.softDrink:
    case BeverageCategory.naturalJuice:
      return [volumeChip, '+${entry.sugarGrams.round()}g Sugar'];
  }
}

class _LogEntryCard extends StatelessWidget {
  const _LogEntryCard({required this.entry});

  final DrinkLogEntry entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final accentColor = categoryAccentColor(entry.category);
    final title = blueprintFor(entry.category).label;
    final chips = _chipsFor(entry);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat('HH:mm').format(entry.timestamp),
                style: AppTextStyles.dataSmall.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSurface,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Text(
                  'LOGGED',
                  style: AppTextStyles.navLabel.copyWith(
                    color: theme.colorScheme.surface,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '${entry.indexLabel} - $title',
            style: AppTextStyles.displaySmall.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: chips
                .map((label) => _buildChip(context, label, accentColor))
                .toList(),
          ),
          if (entry.note != null) ...[
            const SizedBox(height: 8),
            Divider(color: dividerColor),
            const SizedBox(height: 8),
            Text(
              '"${entry.note}"',
              style: AppTextStyles.bodySmall.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildChip(BuildContext context, String label, Color accentColor) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: accentColor.withValues(alpha: 0.15),
        border: Border.all(color: accentColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        '[$label]',
        style: AppTextStyles.bodySmall.copyWith(
          color: theme.colorScheme.onSurface,
        ),
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(width: 8, height: 8, color: theme.colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          label,
          style: AppTextStyles.bodyMedium.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

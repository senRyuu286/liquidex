import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../models/drink_log_entry.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../theme/category_presentation.dart';
import '../../view_models/data_view_model.dart';

class DataScreen extends ConsumerWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final sectionLabelStyle = AppTextStyles.entryIndex.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      letterSpacing: 1.5,
    );

    final state = ref.watch(dataViewModelProvider);
    final activeBreakdown = state.breakdown
        .where((b) => b.totalMl > 0)
        .toList();
    final totalMl = activeBreakdown.fold<double>(
      0,
      (sum, b) => sum + b.totalMl,
    );
    final statusDate = DateFormat(
      'MMM d, yyyy',
    ).format(DateTime.now()).toUpperCase();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section 1: Status Header ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CURRENT STATUS', style: sectionLabelStyle),
                Text(
                  statusDate,
                  style: AppTextStyles.entryIndex.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: dividerColor),
            const SizedBox(height: 16),

            // --- Section 2: Liquid Intake Card ---
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: dividerColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'LIQUID INTAKE',
                        style: AppTextStyles.entryIndex.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Icon(
                          Icons.water_drop,
                          size: 14,
                          color: theme.colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${(state.hydrationPercent * 100).round()}%',
                        style: AppTextStyles.dataLarge.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            state.hydrationCurrentMl.round().toString(),
                            style: AppTextStyles.dataMedium.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            '/ ${state.hydrationTargetMl.round()} ML',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 16,
                        height: 130,
                        child: Column(
                          children: List.generate(5, (index) {
                            return [
                              Container(
                                height: 1,
                                width: 8,
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                              if (index < 4) const Spacer(),
                            ];
                          }).expand((widgets) => widgets).toList(),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 130,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: FractionallySizedBox(
                              heightFactor: state.hydrationPercent,
                              widthFactor: 1,
                              child: Container(color: AppColors.iceBlue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // --- Section 3: Sugar + Caffeine Cards ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _MetricCard(
                    label: 'SUGAR',
                    iconData: Icons.hexagon_outlined,
                    accentColor: AppColors.warningAmber,
                    value: '${state.sugarCurrentGrams.round()}g',
                    limitLabel: '/ ${state.sugarTargetGrams.round()}g allowed',
                    percent: state.sugarPercent,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    label: 'CAFFEINE',
                    iconData: Icons.bolt,
                    accentColor: AppColors.deepPurple,
                    value: '${state.caffeineCurrentMg.round()}mg',
                    limitLabel: '/ ${state.caffeineTargetMg.round()}mg safe',
                    percent: state.caffeinePercent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // --- Section 4: Beverage Breakdown Pie Chart ---
            Text('BEVERAGE BREAKDOWN', style: sectionLabelStyle),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: dividerColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(14),
              child: activeBreakdown.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Center(
                        child: Text(
                          'No drinks logged yet today.',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    )
                  : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SizedBox(
                            height: 160,
                            child: PieChart(
                              PieChartData(
                                sectionsSpace: 2,
                                centerSpaceRadius: 36,
                                sections: activeBreakdown.map((entry) {
                                  final percent = totalMl == 0
                                      ? 0.0
                                      : (entry.totalMl / totalMl * 100);
                                  return PieChartSectionData(
                                    value: entry.totalMl,
                                    color: categoryAccentColor(entry.category),
                                    title: '${percent.toStringAsFixed(0)}%',
                                    titleStyle: AppTextStyles.bodySmall
                                        .copyWith(
                                          color: theme.colorScheme.onPrimary,
                                          fontWeight: FontWeight.w600,
                                        ),
                                    radius: 48,
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              for (
                                int i = 0;
                                i < activeBreakdown.length;
                                i++
                              ) ...[
                                Row(
                                  children: [
                                    Container(
                                      width: 10,
                                      height: 10,
                                      color: categoryAccentColor(
                                        activeBreakdown[i].category,
                                      ),
                                    ),
                                    const SizedBox(width: 6),
                                    Expanded(
                                      child: Text(
                                        categoryDisplayName(
                                          activeBreakdown[i].category,
                                        ),
                                        style: AppTextStyles.bodySmall.copyWith(
                                          color: theme
                                              .colorScheme
                                              .onSurfaceVariant,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                if (i < activeBreakdown.length - 1)
                                  const SizedBox(height: 6),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 16),

            // --- Section 5: Recent Logs ---
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: dividerColor),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'RECENT LOGS',
                          style: AppTextStyles.entryIndex.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          'L-${state.recentLogs.length.toString().padLeft(2, '0')}',
                          style: AppTextStyles.entryIndex.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor, height: 1),
                  ..._buildRecentLogRows(
                    context,
                    state.recentLogs,
                    dividerColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

List<Widget> _buildRecentLogRows(
  BuildContext context,
  List<DrinkLogEntry> recentLogs,
  Color dividerColor,
) {
  final theme = Theme.of(context);

  if (recentLogs.isEmpty) {
    return [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          'Nothing logged yet today.',
          style: AppTextStyles.bodySmall.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ),
    ];
  }

  final rows = <Widget>[];
  for (var i = 0; i < recentLogs.length; i++) {
    final log = recentLogs[i];
    rows.add(
      Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: categoryAccentColor(log.category),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                categoryIcon(log.category),
                color: theme.colorScheme.onPrimary,
                size: 18,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blueprintFor(log.category).label.toUpperCase(),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: theme.colorScheme.onSurface,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    DateFormat('h:mm a').format(log.timestamp),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '+${log.volumeMl.round()}ml',
              style: AppTextStyles.bodyMedium.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
    if (i < recentLogs.length - 1) {
      rows.add(Divider(color: dividerColor, height: 1));
    }
  }
  return rows;
}

/// A bordered metric card showing a label, icon, value, limit, and a
/// linear progress bar (used for Sugar and Caffeine).
class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.label,
    required this.iconData,
    required this.accentColor,
    required this.value,
    required this.limitLabel,
    required this.percent,
  });

  final String label;
  final IconData iconData;
  final Color accentColor;
  final String value;
  final String limitLabel;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;

    return Container(
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
                label,
                style: AppTextStyles.entryIndex.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Icon(iconData, color: accentColor, size: 16),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: AppTextStyles.dataMedium.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          Text(
            limitLabel,
            style: AppTextStyles.bodySmall.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: percent,
              color: accentColor,
              backgroundColor: theme.colorScheme.surfaceContainerHighest,
              minHeight: 6,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  static const String _statusDate = 'JUN 11, 2026';

  static const int _hydrationCurrentMl = 1800;
  static const int _hydrationTargetMl = 2500;
  static const double _hydrationPercent = 0.72;

  static const int _sugarCurrentG = 22;
  static const int _sugarTargetG = 50;

  static const int _caffeineCurrentMg = 140;
  static const int _caffeineTargetMg = 400;

  static const List<_BeverageBreakdown> _breakdown = [
    _BeverageBreakdown(name: 'Water', ml: 800, accentColor: AppColors.iceBlue),
    _BeverageBreakdown(
      name: 'Isotonic',
      ml: 300,
      accentColor: AppColors.electricTeal,
    ),
    _BeverageBreakdown(
      name: 'Soft Drinks',
      ml: 330,
      accentColor: AppColors.neonPink,
    ),
    _BeverageBreakdown(
      name: 'Natural Juices',
      ml: 0,
      accentColor: AppColors.vibrantOrange,
    ),
    _BeverageBreakdown(
      name: 'Energy Drinks',
      ml: 0,
      accentColor: AppColors.acidYellow,
    ),
    _BeverageBreakdown(
      name: 'Caffeine',
      ml: 250,
      accentColor: AppColors.deepPurple,
    ),
  ];

  static const List<_RecentLogPreview> _recentLogs = [
    _RecentLogPreview(
      name: 'GREEN TEA',
      iconData: Icons.emoji_food_beverage,
      accentColor: AppColors.deepPurple,
      time: '10:45 AM',
      volumeLabel: '+330ml',
    ),
    _RecentLogPreview(
      name: 'WATER',
      iconData: Icons.water_drop,
      accentColor: AppColors.iceBlue,
      time: '08:30 AM',
      volumeLabel: '+500ml',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final sectionLabelStyle = AppTextStyles.entryIndex.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      letterSpacing: 1.5,
    );

    final activeBreakdown = _breakdown.where((b) => b.ml > 0).toList();
    final totalMl = activeBreakdown.fold<int>(0, (sum, b) => sum + b.ml);

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
                Text(
                  'CURRENT STATUS',
                  style: AppTextStyles.entryIndex.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    letterSpacing: 1.5,
                  ),
                ),
                Text(
                  _statusDate,
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
                        '${(_hydrationPercent * 100).round()}%',
                        style: AppTextStyles.dataLarge.copyWith(
                          color: theme.colorScheme.onSurface,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            _hydrationCurrentMl.toString(),
                            style: AppTextStyles.dataMedium.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            '/ $_hydrationTargetMl ML',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Changing crossAxisAlignment to center avoids the stretch crash
                  // in unbounded scrolling containers.
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
                              heightFactor: _hydrationPercent,
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
                    value: '${_sugarCurrentG}g',
                    limitLabel: '/ ${_sugarTargetG}g allowed',
                    percent: _sugarCurrentG / _sugarTargetG,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    label: 'CAFFEINE',
                    iconData: Icons.bolt,
                    accentColor: AppColors.deepPurple,
                    value: '${_caffeineCurrentMg}mg',
                    limitLabel: '/ ${_caffeineTargetMg}mg safe',
                    percent: _caffeineCurrentMg / _caffeineTargetMg,
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
              child: Row(
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
                                : (entry.ml / totalMl * 100);
                            return PieChartSectionData(
                              value: entry.ml.toDouble(),
                              color: entry.accentColor,
                              title: '${percent.toStringAsFixed(0)}%',
                              titleStyle: AppTextStyles.bodySmall.copyWith(
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
                        for (int i = 0; i < activeBreakdown.length; i++) ...[
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                color: activeBreakdown[i].accentColor,
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Text(
                                  activeBreakdown[i].name,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
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
                          'L-03',
                          style: AppTextStyles.entryIndex.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: dividerColor, height: 1),
                  for (int i = 0; i < _recentLogs.length; i++) ...[
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: _recentLogs[i].accentColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              _recentLogs[i].iconData,
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
                                  _recentLogs[i].name,
                                  style: AppTextStyles.bodyMedium.copyWith(
                                    color: theme.colorScheme.onSurface,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _recentLogs[i].time,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: theme.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            _recentLogs[i].volumeLabel,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (i < _recentLogs.length - 1)
                      Divider(color: dividerColor, height: 1),
                  ],
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

/// Local placeholder model for a single beverage category's intake.
/// UI-only — will be replaced by a real aggregate model later.
class _BeverageBreakdown {
  const _BeverageBreakdown({
    required this.name,
    required this.ml,
    required this.accentColor,
  });

  final String name;
  final int ml;
  final Color accentColor;
}

/// Local placeholder model for a single recent log entry.
class _RecentLogPreview {
  const _RecentLogPreview({
    required this.name,
    required this.iconData,
    required this.accentColor,
    required this.time,
    required this.volumeLabel,
  });

  final String name;
  final IconData iconData;
  final Color accentColor;
  final String time;
  final String volumeLabel;
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

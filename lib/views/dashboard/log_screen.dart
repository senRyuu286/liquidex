import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class LogScreen extends StatelessWidget {
  const LogScreen({super.key});

  static final List<_LogEntryPreview> _entries = [
    const _LogEntryPreview(
      time: '08:15',
      entryNumber: '#023',
      title: 'Pure Espresso',
      chips: ['250 ml', '+120mg Caffeine'],
      category: _LogCategory.caffeine,
      note: null,
    ),
    const _LogEntryPreview(
      time: '12:45',
      entryNumber: '#024',
      title: 'Workout Hydration',
      chips: ['750 ml', 'Water Intake'],
      category: _LogCategory.water,
      note: null,
    ),
    const _LogEntryPreview(
      time: '16:20',
      entryNumber: '#025',
      title: 'Citrus Soda',
      chips: ['330 ml', '+35g Sugar'],
      category: _LogCategory.softDrink,
      note: 'Logged during final project crunch',
    ),
  ];

  // Placeholder totals for the footer.
  static const String _totalWater = '1000ml';
  static const String _totalSugar = '35g';
  static const String _totalCaffeine = '120mg';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        // Section header bar
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

        // Scrollable timeline list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: _entries.length,
            itemBuilder: (context, index) {
              final entry = _entries[index];
              final isLast = index == _entries.length - 1;

              // Wrapping the row with IntrinsicHeight solves the layout exception
              // by enforcing a finite height from the tallest child (_LogEntryCard).
              return IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Timeline rail
                    SizedBox(
                      width: 24,
                      child: Column(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            color: entry.accentColor,
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
                    Expanded(child: _LogEntryCard(entry: entry)),
                  ],
                ),
              );
            },
          ),
        ),

        // Totals footer wrapped in SafeArea to avoid bottom navigation bar overlap
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
                _TotalRow(label: 'TOTAL WATER: $_totalWater'),
                const SizedBox(height: 6),
                _TotalRow(label: 'TOTAL SUGAR: $_totalSugar'),
                const SizedBox(height: 6),
                _TotalRow(label: 'TOTAL CAFFEINE: $_totalCaffeine'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

/// Category key used to pick a fixed brand accent color per entry.
enum _LogCategory { caffeine, water, softDrink }

/// Local placeholder model for a single timeline log entry.
/// UI-only — will be replaced by a real DrinkLogEntry model later.
class _LogEntryPreview {
  const _LogEntryPreview({
    required this.time,
    required this.entryNumber,
    required this.title,
    required this.chips,
    required this.category,
    required this.note,
  });

  final String time;
  final String entryNumber;
  final String title;
  final List<String> chips;
  final _LogCategory category;
  final String? note;

  Color get accentColor {
    switch (category) {
      case _LogCategory.caffeine:
        return AppColors.deepPurple;
      case _LogCategory.water:
        return AppColors.iceBlue;
      case _LogCategory.softDrink:
        return AppColors.neonPink;
    }
  }
}

/// Card rendering a single timeline entry: time, badge, title, chips,
/// and an optional note.
class _LogEntryCard extends StatelessWidget {
  const _LogEntryCard({required this.entry});

  final _LogEntryPreview entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;

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
                entry.time,
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
            'Entry ${entry.entryNumber} - ${entry.title}',
            style: AppTextStyles.displaySmall.copyWith(
              color: theme.colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: entry.chips
                .map((label) => _buildChip(context, label))
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

  Widget _buildChip(BuildContext context, String label) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: entry.accentColor.withValues(alpha: 0.15),
        border: Border.all(color: entry.accentColor),
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

/// A single row in the totals footer: a small square marker plus a label.
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

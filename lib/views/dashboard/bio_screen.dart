import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class BioScreen extends StatelessWidget {
  const BioScreen({super.key});

  static const String _username = 'TRAINER_JUSTIN';
  static const String _description =
      "Capstone grinder. Three energy drinks deep into finals week. "
      "Hydration is a myth I'm trying to debunk.";

  static const List<_AchievementPreview> _achievements = [
    _AchievementPreview(
      label: 'First Sip',
      iconData: Icons.water_drop,
      accentColor: AppColors.iceBlue,
    ),
    _AchievementPreview(
      label: 'Hydro Streak',
      iconData: Icons.bolt,
      accentColor: AppColors.electricTeal,
    ),
    _AchievementPreview(
      label: 'Sugar Rush',
      iconData: Icons.local_drink,
      accentColor: AppColors.neonPink,
    ),
    _AchievementPreview(
      label: 'Fresh Squeeze',
      iconData: Icons.emoji_food_beverage,
      accentColor: AppColors.vibrantOrange,
    ),
    _AchievementPreview(
      label: 'Overdrive',
      iconData: Icons.flash_on,
      accentColor: AppColors.acidYellow,
    ),
    _AchievementPreview(
      label: 'Night Owl',
      iconData: Icons.coffee,
      accentColor: AppColors.deepPurple,
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

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: dividerColor, width: 1),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.person,
                        color: theme.colorScheme.onPrimary,
                        size: 36,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _username,
                    style: AppTextStyles.displaySmall.copyWith(
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ENTRY #001 — OPERATOR',
                    style: AppTextStyles.entryIndex.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            Text('BIO LOG', style: sectionLabelStyle),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: dividerColor),
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                initialValue: _description,
                maxLines: 3,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  isCollapsed: true,
                ),
              ),
            ),
            const SizedBox(height: 24),

            Text('BADGES EARNED', style: sectionLabelStyle),
            const SizedBox(height: 8),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              // Optimized ratio tighter than 1.0 ensures clean heights across viewports
              childAspectRatio: 1.15,
              children: _achievements
                  .map(
                    (achievement) => _AchievementBadge(
                      iconData: achievement.iconData,
                      label: achievement.label,
                      accentColor: achievement.accentColor,
                    ),
                  )
                  .toList(),
            ),
            // Snugged spacing after the tighter GridView
            const SizedBox(height: 16),

            Text('DAILY CEILINGS', style: sectionLabelStyle),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'HYDRATION GOAL',
                unit: 'ml',
                value: 2500,
                min: 500,
                max: 5000,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'SUGAR CEILING',
                unit: 'g',
                value: 50,
                min: 0,
                max: 150,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'CAFFEINE CEILING',
                unit: 'mg',
                value: 400,
                min: 0,
                max: 800,
              ),
            ),

            const SizedBox(height: 8),
            SafeArea(
              top: false,
              bottom: true,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('SAVE TARGETS'),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

/// Local placeholder model for a single achievement badge.
/// UI-only — will be replaced by a real achievement model later.
class _AchievementPreview {
  const _AchievementPreview({
    required this.label,
    required this.iconData,
    required this.accentColor,
  });

  final String label;
  final IconData iconData;
  final Color accentColor;
}

/// A single decorative achievement badge: accent swatch + label.
class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({
    required this.iconData,
    required this.label,
    required this.accentColor,
  });

  final IconData iconData;
  final String label;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: accentColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Icon(iconData, color: theme.colorScheme.onPrimary, size: 26),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: AppTextStyles.bodySmall.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ],
    );
  }
}

/// A single target editor: label + value readout, plus a draggable
/// slider that responds locally. Does not persist anywhere yet.
class _TargetEditorRow extends StatefulWidget {
  const _TargetEditorRow({
    required this.label,
    required this.unit,
    required this.value,
    required this.min,
    required this.max,
  });

  final String label;
  final String unit;
  final double value;
  final double min;
  final double max;

  @override
  State<_TargetEditorRow> createState() => _TargetEditorRowState();
}

class _TargetEditorRowState extends State<_TargetEditorRow> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

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
                widget.label,
                style: AppTextStyles.entryIndex.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
              Text(
                '${_currentValue.round()} ${widget.unit}',
                style: AppTextStyles.dataMedium.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Slider(
            value: _currentValue,
            min: widget.min,
            max: widget.max,
            onChanged: (newValue) {
              setState(() {
                _currentValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}

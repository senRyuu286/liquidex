import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../utils/input_validators.dart';
import '../../view_models/bio_view_model.dart';

class BioScreen extends ConsumerWidget {
  const BioScreen({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final sectionLabelStyle = AppTextStyles.entryIndex.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
      letterSpacing: 1.5,
    );

    final state = ref.watch(bioViewModelProvider);
    final notifier = ref.read(bioViewModelProvider.notifier);
    final profile = state.profile;

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
                    profile?.username.toUpperCase() ?? 'LOADING...',
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
                // Keyed on profile id so this picks up the real bio
                // once the profile finishes loading. Not wired to a
                // save action: no persistence path was specced for
                // bio text, only the three daily targets below.
                key: ValueKey(profile?.id),
                initialValue: profile?.description ?? 'No bio yet.',
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
            const SizedBox(height: 16),

            Text('DAILY CEILINGS', style: sectionLabelStyle),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'HYDRATION GOAL',
                unit: 'ml',
                value: state.hydrationTargetMl,
                min: kMinHydrationTargetMl,
                max: kMaxHydrationTargetMl,
                errorText: state.hydrationError,
                onChanged: notifier.setHydrationDraft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'SUGAR CEILING',
                unit: 'g',
                value: state.dailySugarLimitGrams,
                min: kMinSugarLimitGrams,
                max: kMaxSugarLimitGrams,
                errorText: state.sugarError,
                onChanged: notifier.setSugarDraft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _TargetEditorRow(
                label: 'CAFFEINE CEILING',
                unit: 'mg',
                value: state.dailyCaffeineLimitMg,
                min: kMinCaffeineLimitMg,
                max: kMaxCaffeineLimitMg,
                errorText: state.caffeineError,
                onChanged: notifier.setCaffeineDraft,
              ),
            ),

            const SizedBox(height: 8),
            SafeArea(
              top: false,
              bottom: true,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (state.isSaving || state.hasErrors)
                      ? null
                      : () async {
                          final success = await notifier.save();
                          if (!context.mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                success
                                    ? 'Targets saved.'
                                    : 'Could not save targets. Check the fields above.',
                              ),
                            ),
                          );
                        },
                  child: Text(state.isSaving ? 'SAVING...' : 'SAVE TARGETS'),
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
/// UI-only — no achievement model exists yet in the provider layer.
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

/// A single target editor: label + value readout, a draggable slider,
/// and an optional validation message. Fully controlled by [value]
/// and [onChanged]; holds no internal state, so the view model stays
/// the single source of truth.
class _TargetEditorRow extends StatelessWidget {
  const _TargetEditorRow({
    required this.label,
    required this.unit,
    required this.value,
    required this.min,
    required this.max,
    required this.onChanged,
    this.errorText,
  });

  final String label;
  final String unit;
  final double value;
  final double min;
  final double max;
  final String? errorText;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final hasError = errorText != null;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: hasError ? theme.colorScheme.error : dividerColor,
        ),
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
              Text(
                '${value.round()} $unit',
                style: AppTextStyles.dataMedium.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Slider(
            value: value.clamp(min, max),
            min: min,
            max: max,
            onChanged: onChanged,
          ),
          if (hasError)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                errorText!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

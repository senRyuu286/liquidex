import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';


class DexScreen extends StatelessWidget {
  const DexScreen({super.key});

  static final List<_BlueprintPreview> _previews = [
    _BlueprintPreview(
      index: 1,
      name: 'Pure H2O',
      category: 'Water',
      iconData: Icons.water_drop,
      accentColor: AppColors.iceBlue,
      metricsLabel: 'Vol: 500ml | Sugar: 0g',
    ),
    _BlueprintPreview(
      index: 12,
      name: 'Hydro-Fuel',
      category: 'Isotonic',
      iconData: Icons.bolt,
      accentColor: AppColors.electricTeal,
      metricsLabel: 'Vol: 330ml | Sugar: 14g',
    ),
    _BlueprintPreview(
      index: 35,
      name: 'Sugar Bomb',
      category: 'Soft Drinks',
      iconData: Icons.local_drink,
      accentColor: AppColors.neonPink,
      metricsLabel: 'Vol: 355ml | Sugar: 39g',
    ),
    _BlueprintPreview(
      index: 50,
      name: "Nature's Blend",
      category: 'Natural Juices',
      iconData: Icons.emoji_food_beverage,
      accentColor: AppColors.vibrantOrange,
      metricsLabel: 'Vol: 300ml | Sugar: 22g',
    ),
    _BlueprintPreview(
      index: 77,
      name: 'Overdrive',
      category: 'Energy Drinks',
      iconData: Icons.flash_on,
      accentColor: AppColors.acidYellow,
      metricsLabel: 'Vol: 330ml | Caffeine: 140mg | Sugar: 27g',
    ),
    _BlueprintPreview(
      index: 99,
      name: 'Focus Brew',
      category: 'Caffeine',
      iconData: Icons.coffee,
      accentColor: AppColors.deepPurple,
      metricsLabel: 'Vol: 250ml | Caffeine: 150mg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search Catalog Blueprints...',
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemCount: _previews.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _BlueprintCard(entry: _previews[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _BlueprintPreview {
  const _BlueprintPreview({
    required this.index,
    required this.name,
    required this.category,
    required this.iconData,
    required this.accentColor,
    required this.metricsLabel,
  });

  final int index;
  final String name;
  final String category;
  final IconData iconData;
  final Color accentColor;
  final String metricsLabel;
}

class _BlueprintCard extends StatelessWidget {
  const _BlueprintCard({required this.entry});

  final _BlueprintPreview entry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dividerColor = theme.dividerTheme.color ?? theme.colorScheme.outline;
    final paddedIndex = entry.index.toString().padLeft(3, '0');

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: dividerColor),
        borderRadius: BorderRadius.circular(4),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Index column
            SizedBox(
              width: 64,
              child: Center(
                child: Text(
                  'NO. $paddedIndex',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.entryIndex.copyWith(
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
            VerticalDivider(color: dividerColor, width: 1, thickness: 1),
            // Icon swatch
            Container(
              width: 56,
              height: 56,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: entry.accentColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Icon(
                  entry.iconData,
                  color: theme.colorScheme.onPrimary,
                  size: 26,
                ),
              ),
            ),
            // Name + metrics
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, right: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entry.name,
                      style: AppTextStyles.displaySmall.copyWith(
                        color: theme.colorScheme.onSurface,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      entry.metricsLabel,
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
}

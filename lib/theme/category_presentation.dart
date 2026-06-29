import 'package:flutter/material.dart';
import '../models/beverage_blueprint.dart';
import '../models/beverage_category.dart';
import 'app_colors.dart';

IconData categoryIcon(BeverageCategory category) {
  switch (category) {
    case BeverageCategory.water:
      return Icons.water_drop;
    case BeverageCategory.isotonic:
      return Icons.bolt;
    case BeverageCategory.softDrink:
      return Icons.local_drink;
    case BeverageCategory.naturalJuice:
      return Icons.emoji_food_beverage;
    case BeverageCategory.energyDrink:
      return Icons.flash_on;
    case BeverageCategory.caffeine:
      return Icons.coffee;
  }
}

Color categoryAccentColor(BeverageCategory category) {
  switch (category) {
    case BeverageCategory.water:
      return AppColors.iceBlue;
    case BeverageCategory.isotonic:
      return AppColors.electricTeal;
    case BeverageCategory.softDrink:
      return AppColors.neonPink;
    case BeverageCategory.naturalJuice:
      return AppColors.vibrantOrange;
    case BeverageCategory.energyDrink:
      return AppColors.acidYellow;
    case BeverageCategory.caffeine:
      return AppColors.deepPurple;
  }
}

String categoryDisplayName(BeverageCategory category) {
  switch (category) {
    case BeverageCategory.water:
      return 'Water';
    case BeverageCategory.isotonic:
      return 'Isotonic';
    case BeverageCategory.softDrink:
      return 'Soft Drinks';
    case BeverageCategory.naturalJuice:
      return 'Natural Juices';
    case BeverageCategory.energyDrink:
      return 'Energy Drinks';
    case BeverageCategory.caffeine:
      return 'Caffeine';
  }
}

/// The single locked [BeverageBlueprint] variant for [category], used
/// for its default label and entry number.
BeverageBlueprint blueprintFor(BeverageCategory category) {
  switch (category) {
    case BeverageCategory.water:
      return const BeverageBlueprint.water();
    case BeverageCategory.isotonic:
      return const BeverageBlueprint.isotonic();
    case BeverageCategory.softDrink:
      return const BeverageBlueprint.softDrink();
    case BeverageCategory.naturalJuice:
      return const BeverageBlueprint.naturalJuice();
    case BeverageCategory.energyDrink:
      return const BeverageBlueprint.energyDrink();
    case BeverageCategory.caffeine:
      return const BeverageBlueprint.caffeineDrink();
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import 'beverage_category.dart';

part 'beverage_blueprint.freezed.dart';
part 'beverage_blueprint.g.dart';

enum ImpactLevel {
  full,
  partial,
  none,
}

@freezed
sealed class BeverageBlueprint with _$BeverageBlueprint {
  const factory BeverageBlueprint.water({
    @Default('Entry #001') String entryNumber,
    @Default('Pure H2O') String label,
    @Default(BeverageCategory.water) BeverageCategory category,
    @Default(ImpactLevel.full) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.none) ImpactLevel sugarImpact,
    @Default(ImpactLevel.none) ImpactLevel caffeineImpact,
  }) = Water;

  const factory BeverageBlueprint.isotonic({
    @Default('Entry #012') String entryNumber,
    @Default('Hydro-Fuel') String label,
    @Default(BeverageCategory.isotonic) BeverageCategory category,
    @Default(ImpactLevel.partial) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.full) ImpactLevel sugarImpact,
    @Default(ImpactLevel.none) ImpactLevel caffeineImpact,
    @Default(true) bool electrolyteFlag,
  }) = Isotonic;

  const factory BeverageBlueprint.softDrink({
    @Default('Entry #035') String entryNumber,
    @Default('Sugar Bomb') String label,
    @Default(BeverageCategory.softDrink) BeverageCategory category,
    @Default(ImpactLevel.none) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.full) ImpactLevel sugarImpact,
    @Default(ImpactLevel.none) ImpactLevel caffeineImpact,
  }) = SoftDrink;

  const factory BeverageBlueprint.naturalJuice({
    @Default('Entry #050') String entryNumber,
    @Default("Nature's Blend") String label,
    @Default(BeverageCategory.naturalJuice) BeverageCategory category,
    @Default(ImpactLevel.partial) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.full) ImpactLevel sugarImpact,
    @Default(ImpactLevel.none) ImpactLevel caffeineImpact,
  }) = NaturalJuice;

  const factory BeverageBlueprint.energyDrink({
    @Default('Entry #077') String entryNumber,
    @Default('Overdrive') String label,
    @Default(BeverageCategory.energyDrink) BeverageCategory category,
    @Default(ImpactLevel.none) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.full) ImpactLevel sugarImpact,
    @Default(ImpactLevel.full) ImpactLevel caffeineImpact,
  }) = EnergyDrink;

  const factory BeverageBlueprint.caffeineDrink({
    @Default('Entry #099') String entryNumber,
    @Default('Focus Brew') String label,
    @Default(BeverageCategory.caffeine) BeverageCategory category,
    @Default(ImpactLevel.none) ImpactLevel hydrationImpact,
    @Default(ImpactLevel.none) ImpactLevel sugarImpact,
    @Default(ImpactLevel.full) ImpactLevel caffeineImpact,
    @Default(false) bool hasSugarToggle,
  }) = CaffeineDrink;

  factory BeverageBlueprint.fromJson(Map<String, dynamic> json) =>
      _$BeverageBlueprintFromJson(json);
}
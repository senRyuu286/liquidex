import 'package:json_annotation/json_annotation.dart';

enum BeverageCategory {
  @JsonValue('water')
  water,
  @JsonValue('isotonic')
  isotonic,
  @JsonValue('soft_drink')
  softDrink,
  @JsonValue('natural_juice')
  naturalJuice,
  @JsonValue('energy_drink')
  energyDrink,
  @JsonValue('caffeine')
  caffeine,
}

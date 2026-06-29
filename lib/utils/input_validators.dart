const double kMinVolumeMl = 1;
const double kMaxVolumeMl = 5000;

const double kMinHydrationTargetMl = 500;
const double kMaxHydrationTargetMl = 10000;

const double kMinSugarLimitGrams = 0;
const double kMaxSugarLimitGrams = 500;

const double kMinCaffeineLimitMg = 0;
const double kMaxCaffeineLimitMg = 1000;

String? validateVolumeMl(double value) {
  if (value < kMinVolumeMl || value > kMaxVolumeMl) {
    return 'Volume must be between ${kMinVolumeMl.toInt()} and '
        '${kMaxVolumeMl.toInt()} ml.';
  }
  return null;
}

String? validateHydrationTargetMl(double value) {
  if (value < kMinHydrationTargetMl || value > kMaxHydrationTargetMl) {
    return 'Hydration goal must be between ${kMinHydrationTargetMl.toInt()} '
        'and ${kMaxHydrationTargetMl.toInt()} ml.';
  }
  return null;
}

String? validateSugarLimitGrams(double value) {
  if (value < kMinSugarLimitGrams || value > kMaxSugarLimitGrams) {
    return 'Sugar ceiling must be between ${kMinSugarLimitGrams.toInt()} '
        'and ${kMaxSugarLimitGrams.toInt()} g.';
  }
  return null;
}

String? validateCaffeineLimitMg(double value) {
  if (value < kMinCaffeineLimitMg || value > kMaxCaffeineLimitMg) {
    return 'Caffeine ceiling must be between ${kMinCaffeineLimitMg.toInt()} '
        'and ${kMaxCaffeineLimitMg.toInt()} mg.';
  }
  return null;
}

enum WarningLevel {
  withinLimit,
  approaching,
  exceeded,
}

enum HydrationGoalLevel {
  withinLimit,
  achieved,
}

WarningLevel warningLevelFor({
  required double current,
  required double ceiling,
}) {
  if (ceiling <= 0) return WarningLevel.exceeded;

  final ratio = current / ceiling;

  if (ratio >= 1.0) return WarningLevel.exceeded;
  if (ratio >= 0.75) return WarningLevel.approaching;
  return WarningLevel.withinLimit;
}

HydrationGoalLevel hydrationGoalLevelFor({
  required double current,
  required double goal,
}) {
  if (goal <= 0) return HydrationGoalLevel.achieved;
  return current >= goal
      ? HydrationGoalLevel.achieved
      : HydrationGoalLevel.withinLimit;
}
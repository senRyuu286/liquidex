import 'package:flutter/material.dart';

abstract final class AppColors {
  AppColors._();

  // ---------------------------------------------------------------------------
  // Core Surfaces
  // ---------------------------------------------------------------------------

  /// Primary UI surface. Used for card backgrounds and panel fills.
  static const Color navyPrimary = Color(0xFF353F72);

  /// Deep structural base. Used for screen backgrounds and dividers.
  static const Color trueBlack = Color(0xFF000000);

  // ---------------------------------------------------------------------------
  // Warning Level States
  // ---------------------------------------------------------------------------

  /// WithinLimit state. Progress bars and indicators below 75% of ceiling.
  static const Color terminalGreen = Color(0xFF39FF14);

  /// Approaching state. Progress bars between 75% and 99% of ceiling.
  static const Color warningAmber = Color(0xFFFFC300);

  /// Exceeded state. Progress bars at or above 100% of ceiling.
  /// Also used as the swipe-to-delete backdrop on the Log Screen.
  static const Color dangerRed = Color(0xFFFF2D55);

  // ---------------------------------------------------------------------------
  // Blueprint Category Accents
  // ---------------------------------------------------------------------------

  /// Water category accent.
  static const Color iceBlue = Color(0xFF00BFFF);

  /// Isotonic / Sports Drinks category accent.
  static const Color electricTeal = Color(0xFF00E5CC);

  /// Soft Drinks & Processed Juices category accent.
  static const Color neonPink = Color(0xFFFF2D78);

  /// Natural Juices & Smoothies category accent.
  static const Color vibrantOrange = Color(0xFFFF6B00);

  /// Energy Drinks category accent.
  static const Color acidYellow = Color(0xFFDFFF00);

  /// Caffeine Drinks category accent.
  static const Color deepPurple = Color(0xFF9B5DE5);

  // ---------------------------------------------------------------------------
  // Utility
  // ---------------------------------------------------------------------------

  /// Razor-thin border color for retro panel outlines.
  static const Color panelBorder = Color(0xFF4A5290);

  /// Muted surface for inactive slots or disabled states.
  static const Color dimSurface = Color(0xFF1E2340);

  /// Primary text on dark surfaces.
  static const Color textPrimary = Color(0xFFFFFFFF);

  /// Secondary / subdued text for metadata and timestamps.
  static const Color textSecondary = Color(0xFF8A90B4);
}

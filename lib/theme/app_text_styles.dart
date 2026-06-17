import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// Standalone text styles for one-off use anywhere in the widget tree.

/// For theme-aware styles (e.g., [Theme.of(context).textTheme.titleLarge]),
/// see [liquidexTextTheme] in this file.
abstract final class AppTextStyles {
  AppTextStyles._();

  // ---------------------------------------------------------------------------
  // Display — Press Start 2P
  // Used for screen titles and major section headers.
  // ---------------------------------------------------------------------------

  /// Large screen title. Dex Screen header, Auth Hub title.
  static TextStyle get displayLarge => GoogleFonts.pressStart2p(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  /// Mid-level section header. Panel labels, category names.
  static TextStyle get displayMedium => GoogleFonts.pressStart2p(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  /// Small header. Card titles, slot labels.
  static TextStyle get displaySmall => GoogleFonts.pressStart2p(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.6,
  );

  // ---------------------------------------------------------------------------
  // Entry Index — Press Start 2P
  // Used for Dex entry labels (e.g., "Entry #001").
  // ---------------------------------------------------------------------------

  /// Dex-style entry number label on grid slots and log rows.
  static TextStyle get entryIndex => GoogleFonts.pressStart2p(
    fontSize: 8,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.4,
    letterSpacing: 1.2,
  );

  // ---------------------------------------------------------------------------
  // Data & Values — VT323
  // Used for metric readings, volume amounts, and timestamps.
  // ---------------------------------------------------------------------------

  /// Large metric readout. Progress totals, aggregate summary bar values.
  static TextStyle get dataLarge => GoogleFonts.vt323(
    fontSize: 36,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  /// Mid-size data value. Per-slot volume readings, ceiling values.
  static TextStyle get dataMedium => GoogleFonts.vt323(
    fontSize: 24,
    color: AppColors.textPrimary,
    height: 1.0,
  );

  /// Small data value. Timestamps, secondary metric labels.
  static TextStyle get dataSmall => GoogleFonts.vt323(
    fontSize: 18,
    color: AppColors.textSecondary,
    height: 1.0,
  );

  // ---------------------------------------------------------------------------
  // Body & UI Copy — Inter
  // Used for notes, descriptions, input hints, and error messages.
  // ---------------------------------------------------------------------------

  /// Standard body text. Notes field content, general descriptions.
  static TextStyle get bodyMedium => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  /// Small body text. Input hints, helper text, secondary descriptions.
  static TextStyle get bodySmall => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  /// Error and validation message text.
  static TextStyle get errorText => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.dangerRed,
    height: 1.4,
  );

  // ---------------------------------------------------------------------------
  // Labels & Buttons — Rubik
  // Used for action buttons, quick-log presets, and navigation labels.
  // ---------------------------------------------------------------------------

  /// Primary button label. Confirm, submit, and save actions.
  static TextStyle get buttonLabel => GoogleFonts.rubik(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.8,
  );

  /// Secondary button label. Preset volume buttons, toggle labels.
  static TextStyle get buttonLabelSmall => GoogleFonts.rubik(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.6,
  );

  /// Navigation bar and tab label.
  static TextStyle get navLabel => GoogleFonts.rubik(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
  );
}

// -----------------------------------------------------------------------------
// TextTheme
// Registered in AppTheme and consumed via Theme.of(context).textTheme.
// Slot mapping follows Material 3 naming conventions.
// -----------------------------------------------------------------------------

/// The [TextTheme] for Liquidex, wired into [ThemeData] via [AppTheme].
///
/// Slot mapping:
/// - `displayLarge/Medium/Small` → Press Start 2P (screen titles, headers)
/// - `titleLarge/Medium/Small`   → Press Start 2P (card titles, slot labels)
/// - `bodyLarge/Medium/Small`    → Inter (notes, descriptions, hints)
/// - `labelLarge/Medium/Small`   → Rubik (buttons, presets, nav labels)
TextTheme get liquidexTextTheme => TextTheme(
  // Display — Press Start 2P
  displayLarge: AppTextStyles.displayLarge,
  displayMedium: AppTextStyles.displayMedium,
  displaySmall: AppTextStyles.displaySmall,

  // Title — Press Start 2P (smaller, card-level)
  titleLarge: AppTextStyles.displaySmall,
  titleMedium: AppTextStyles.entryIndex.copyWith(fontSize: 10),
  titleSmall: AppTextStyles.entryIndex,

  // Body — Inter
  bodyLarge: AppTextStyles.bodyMedium.copyWith(fontSize: 16),
  bodyMedium: AppTextStyles.bodyMedium,
  bodySmall: AppTextStyles.bodySmall,

  // Label — Rubik
  labelLarge: AppTextStyles.buttonLabel,
  labelMedium: AppTextStyles.buttonLabelSmall,
  labelSmall: AppTextStyles.navLabel,
);

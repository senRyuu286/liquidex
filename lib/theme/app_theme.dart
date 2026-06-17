import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

/// The single [ThemeData] entry point for Liquidex.
///

abstract final class AppTheme {
  AppTheme._();

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // -----------------------------------------------------------------------
    // Color Scheme
    // -----------------------------------------------------------------------
    colorScheme: const ColorScheme.dark(
      primary: AppColors.navyPrimary,
      onPrimary: AppColors.textPrimary,
      secondary: AppColors.electricTeal,
      onSecondary: AppColors.trueBlack,
      error: AppColors.dangerRed,
      onError: AppColors.textPrimary,
      surface: AppColors.dimSurface,
      onSurface: AppColors.textPrimary,
    ),

    // -----------------------------------------------------------------------
    // Scaffold & Canvas
    // -----------------------------------------------------------------------
    scaffoldBackgroundColor: AppColors.trueBlack,
    canvasColor: AppColors.trueBlack,

    // -----------------------------------------------------------------------
    // Typography
    // -----------------------------------------------------------------------
    textTheme: liquidexTextTheme,

    // -----------------------------------------------------------------------
    // AppBar
    // -----------------------------------------------------------------------
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.trueBlack,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: AppTextStyles.displayMedium,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    ),

    // -----------------------------------------------------------------------
    // Cards
    // Retro panel containers used across the Dex grid and Log rows.
    // -----------------------------------------------------------------------
    cardTheme: CardThemeData(
      color: AppColors.navyPrimary,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.panelBorder, width: 1),
      ),
    ),

    // -----------------------------------------------------------------------
    // Input Fields
    // Used on SignIn, SignUp, Welcome, and Bio screens.
    // -----------------------------------------------------------------------
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.dimSurface,
      hintStyle: AppTextStyles.bodySmall,
      errorStyle: AppTextStyles.errorText,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.panelBorder, width: 1),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.navyPrimary, width: 1.5),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.dangerRed, width: 1),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        borderSide: BorderSide(color: AppColors.dangerRed, width: 1.5),
      ),
    ),

    // -----------------------------------------------------------------------
    // Elevated Button
    // Primary action buttons: confirm log, save targets, submit auth.
    // -----------------------------------------------------------------------
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.navyPrimary,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        textStyle: AppTextStyles.buttonLabel,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          side: BorderSide(color: AppColors.panelBorder, width: 1),
        ),
      ),
    ),

    // -----------------------------------------------------------------------
    // Outlined Button
    // Secondary actions: skip, cancel, navigation shortcuts.
    // -----------------------------------------------------------------------
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.textPrimary,
        textStyle: AppTextStyles.buttonLabelSmall,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        side: const BorderSide(color: AppColors.panelBorder, width: 1),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
    ),

    // -----------------------------------------------------------------------
    // FAB
    // Dex Screen quick-log trigger button.
    // -----------------------------------------------------------------------
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.navyPrimary,
      foregroundColor: AppColors.textPrimary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        side: BorderSide(color: AppColors.panelBorder, width: 1),
      ),
    ),

    // -----------------------------------------------------------------------
    // Bottom Sheet
    // FAB quick-log modal and any other bottom sheet overlays.
    // -----------------------------------------------------------------------
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.dimSurface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
        side: BorderSide(color: AppColors.panelBorder, width: 1),
      ),
    ),

    // -----------------------------------------------------------------------
    // Dividers
    // -----------------------------------------------------------------------
    dividerTheme: const DividerThemeData(
      color: AppColors.panelBorder,
      thickness: 1,
      space: 1,
    ),

    // -----------------------------------------------------------------------
    // Slider
    // Volume input on the logging modal, Welcome, and Bio screens.
    // -----------------------------------------------------------------------
    sliderTheme: const SliderThemeData(
      activeTrackColor: AppColors.navyPrimary,
      inactiveTrackColor: AppColors.dimSurface,
      thumbColor: AppColors.textPrimary,
      overlayColor: Color(0x29353F72),
      trackHeight: 3,
    ),

    // -----------------------------------------------------------------------
    // Progress Indicator
    // Linear bars on Dex grid slots and the aggregate summary strip.
    // -----------------------------------------------------------------------
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.terminalGreen,
      linearTrackColor: AppColors.dimSurface,
      linearMinHeight: 6,
    ),

    // -----------------------------------------------------------------------
    // Icon
    // -----------------------------------------------------------------------
    iconTheme: const IconThemeData(color: AppColors.textPrimary, size: 20),
  );
}

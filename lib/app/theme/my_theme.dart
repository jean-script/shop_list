import 'package:flutter/material.dart';
import 'package:shop_list/app/theme/hexcolor.dart';

class MyTheme {
  // ============================================================
  // COLORS
  // ============================================================

  static const primary = "#059669"; // Verde
  static const secondary = "#F59E0B"; // Âmbar
  static const tentiary = "#06B6D4"; // Ciano

  static const neutral = "#64748B";

  static const backgroundLight = "#EEF4FF";
  static const surfaceLight = "#E2ECFF";

  static const backgroundDark = "#111827";
  static const surfaceDark = "#1E293B";

  static const title = Colors.black;
  static const subtitle = Colors.grey;

  static const fontFamily = 'PlusJakartaSans';

  // ============================================================
  // LIGHT THEME
  // ============================================================

  static final light = ThemeData(
    brightness: Brightness.light,

    fontFamily: fontFamily,

    useMaterial3: true,

    primaryColor: HexColor(primary),

    scaffoldBackgroundColor: HexColor(backgroundLight),

    appBarTheme: AppBarTheme(
      backgroundColor: HexColor(primary),
      foregroundColor: Colors.white,
      elevation: 1,
      centerTitle: false,
    ),

    colorScheme: ColorScheme.light(
      primary: HexColor(primary),
      secondary: HexColor(secondary),
      tertiary: HexColor(tentiary),

      surface: HexColor(surfaceLight),

      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onTertiary: Colors.white,

      onSurface: const Color(0xFF172033),
    ),

    // ==========================================================
    // BUTTONS
    // ==========================================================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor(primary),
        foregroundColor: Colors.white,

        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),

    // ==========================================================
    // OUTLINED BUTTON
    // ==========================================================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: HexColor(primary),

        side: BorderSide(color: HexColor(primary)),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      ),
    ),

    // ==========================================================
    // TEXT BUTTON
    // ==========================================================
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: HexColor(primary)),
    ),

    // ==========================================================
    // FLOATING ACTION BUTTON
    // ==========================================================
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HexColor(primary),
      foregroundColor: Colors.white,
      elevation: 3,
    ),

    // ==========================================================
    // CARD
    // ==========================================================
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
    ),

    // ==========================================================
    // INPUT
    // ==========================================================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,

      hintStyle: TextStyle(color: HexColor(neutral)),

      prefixIconColor: HexColor(neutral),

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor("#CBD5E1")),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor("#CBD5E1")),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor(primary), width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
    ),

    // ==========================================================
    // ICON
    // ==========================================================
    iconTheme: IconThemeData(color: HexColor(primary)),

    // ==========================================================
    // TEXT
    // ==========================================================
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF172033),
      ),

      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF172033),
      ),

      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: const Color(0xFF172033),
      ),

      bodyLarge: TextStyle(fontSize: 16, color: const Color(0xFF334155)),

      bodyMedium: TextStyle(fontSize: 14, color: const Color(0xFF475569)),

      bodySmall: TextStyle(fontSize: 12, color: HexColor(neutral)),

      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: HexColor(primary),
      ),

      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: HexColor(primary),
      ),

      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: HexColor(neutral),
      ),
    ),

    // ==========================================================
    // DIVIDER
    // ==========================================================
    dividerTheme: DividerThemeData(color: HexColor("#CBD5E1"), thickness: 1),
  );

  // ============================================================
  // DARK THEME
  // ============================================================

  static final dark = ThemeData(
    brightness: Brightness.dark,

    fontFamily: fontFamily,

    useMaterial3: true,

    primaryColor: HexColor(primary),

    scaffoldBackgroundColor: HexColor(backgroundDark),

    appBarTheme: AppBarTheme(
      backgroundColor: HexColor(backgroundDark),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    colorScheme: ColorScheme.dark(
      primary: HexColor(primary),
      secondary: HexColor(secondary),
      tertiary: HexColor(tentiary),

      surface: HexColor(surfaceDark),

      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onTertiary: Colors.white,

      onSurface: Colors.white,
    ),

    // ==========================================================
    // BUTTONS
    // ==========================================================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: HexColor(primary),
        foregroundColor: Colors.white,
        elevation: 0,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: HexColor(tentiary),

        side: BorderSide(color: HexColor(tentiary)),

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: HexColor(tentiary)),
    ),

    // ==========================================================
    // FAB
    // ==========================================================
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: HexColor(primary),
      foregroundColor: Colors.white,
    ),

    // ==========================================================
    // CARD
    // ==========================================================
    cardTheme: CardThemeData(
      color: HexColor(surfaceDark),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.zero,
    ),

    // ==========================================================
    // INPUT
    // ==========================================================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: HexColor(surfaceDark),

      hintStyle: TextStyle(color: HexColor("#94A3B8")),

      prefixIconColor: HexColor("#94A3B8"),

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor("#475569")),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor("#475569")),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: HexColor(primary), width: 2),
      ),
    ),

    // ==========================================================
    // ICON
    // ==========================================================
    iconTheme: IconThemeData(color: HexColor(tentiary)),

    // ==========================================================
    // TEXT
    // ==========================================================
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      bodyLarge: TextStyle(fontSize: 16, color: Colors.white70),

      bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),

      bodySmall: TextStyle(fontSize: 12, color: Colors.white54),

      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    ),

    // ==========================================================
    // DIVIDER
    // ==========================================================
    dividerTheme: const DividerThemeData(
      color: Color(0xFF334155),
      thickness: 1,
    ),
  );
}

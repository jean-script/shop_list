import 'package:flutter/material.dart';

class MyTheme {
  static const primary = Colors.blue;
  static const primaryDark = Colors.blueAccent;
  static const lightBlueAccent = Colors.lightBlueAccent;

  static const title = Colors.black;
  static const subtitle = Colors.grey;

  /// 🌞 LIGHT
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: Colors.grey[100],

    appBarTheme: const AppBarTheme(
      backgroundColor: primary,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    colorScheme: ColorScheme.light(
      primary: primary,
      secondary: Colors.blueAccent,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
      ),
    ),

    cardColor: Colors.white,

    iconTheme: IconThemeData(color: Colors.white),

    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),

      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),

      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),

      labelLarge: TextStyle(color: Colors.white, fontSize: 16),

      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),

      bodyMedium: TextStyle(color: Colors.black87),
    ),
  );

  /// 🌙 DARK
  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryDark,
    scaffoldBackgroundColor: const Color.fromARGB(255, 48, 47, 47),

    appBarTheme: const AppBarTheme(
      backgroundColor: primaryDark,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    colorScheme: ColorScheme.dark(
      primary: primaryDark,
      secondary: Colors.blueAccent,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryDark,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryDark,
        foregroundColor: Colors.white,
      ),
    ),

    cardColor: const Color.fromARGB(255, 48, 47, 47),

    textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white70)),
  );
}

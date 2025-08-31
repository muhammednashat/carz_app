import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkBg = Color(0xFF12130D);
  static const Color lightBg = Color(0xFFFFFFFF);
  static const Color accent = Color(0xFFD4F043);
  static const Color textDark = Color(0xFFFFFFFF);
  static const Color textLight = Color(0xFF12130D);
  static const Color subtextGray = Color(0xFFA0A0A0);

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: darkBg,
    primaryColor: accent,
    colorScheme: ColorScheme.dark(
      surface: Color(0xFF1f2215),
      primary: accent,
      secondary: accent,
      onPrimary: textDark,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(fontWeight: FontWeight.bold, color: textDark),
      titleLarge: TextStyle(color: textDark, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: textDark),
      titleSmall: TextStyle(color: textDark),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF1E1F1A),
      hintStyle: TextStyle(color: subtextGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: textDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: lightBg,

    primaryColor: accent,

    // this is the foundation of main color. All widgets
    // will follow these colors unless you overriding
    colorScheme: ColorScheme.light(
      surface:
          lightBg, // Background color for surfaces like cards, sheets, dialogs
      primary:
          accent, // Main brand color used across the app (buttons, app bar, etc.)
      secondary:
          accent, // Secondary/accent color for highlights like FABs, chips
      onPrimary:
          textLight, // Text/icon color shown on top of the primary color (e.g., button text)
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(color: textLight, fontWeight: FontWeight.bold),
      
      titleLarge: TextStyle(color: textLight, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: textLight),
      titleSmall: TextStyle(color: textLight),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF6F6F6),
      hintStyle: TextStyle(color: subtextGray),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: accent,
        foregroundColor: textLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );
}

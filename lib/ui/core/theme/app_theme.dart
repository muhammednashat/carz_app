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
      surface: darkBg,
      primary: accent,
      secondary: accent,
      onPrimary: textDark,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: textDark),
      bodyMedium: TextStyle(color: subtextGray),
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
    colorScheme: ColorScheme.light(
      surface: lightBg,
      primary: accent,
      secondary: accent,
      onPrimary: textLight,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: textLight),
      bodyMedium: TextStyle(color: subtextGray),
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

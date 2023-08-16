import 'package:flutter/material.dart';

class Themes {
  Color lightPrimaryColor = Colors.white;
  Color lightSecondaryColor = Colors.black;
  Color darkPrimaryColor = Colors.black;
  Color darkSecondaryColor = Colors.white;
  Color accentColor = Colors.blueAccent;

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: _instance.lightPrimaryColor,
      foregroundColor: _instance.lightSecondaryColor,
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.white.withOpacity(0.8)),
    navigationRailTheme: NavigationRailThemeData(backgroundColor: _instance.lightPrimaryColor),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _instance.accentColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    navigationBarTheme: NavigationBarThemeData(backgroundColor: Colors.black.withOpacity(0.8)),
    navigationRailTheme: NavigationRailThemeData(backgroundColor: _instance.darkPrimaryColor),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _instance.darkPrimaryColor,
      secondary: _instance.darkSecondaryColor,
    ),
  );
}

Themes _instance = Themes();

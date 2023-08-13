import 'package:flutter/material.dart';

class Themes {
  Color lightPrimaryColor = Colors.white;
  Color lightSecondaryColor = Colors.black;
  Color dartPrimaryColor = Colors.black;
  Color darkSecondaryColor = Colors.white;
  Color accentColor = Colors.purple;

  static ThemeData lightTheme = ThemeData(
    primaryColor: ThemeData.light().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: _instance.lightPrimaryColor,
      secondary: _instance.lightSecondaryColor,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: _instance.lightPrimaryColor,
      foregroundColor: _instance.lightSecondaryColor,
    ),
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(
    //   foregroundColor: _instance.lightPrimaryColor,
    //   backgroundColor: _instance.lightSecondaryColor,
    // )),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _instance.dartPrimaryColor,
      secondary: _instance.darkSecondaryColor,
    ),
  );
}

Themes _instance = Themes();

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Themes {
  Color lightPrimaryColor = Colors.white;
  Color lightSecondaryColor = Colors.black;
  Color darkPrimaryColor = Colors.black;
  Color darkSecondaryColor = Colors.white;
  Color accentColor = Colors.blueAccent;

  static ThemeData lightTheme = ThemeData(
    // primaryColor: ThemeData.light().scaffoldBackgroundColor,
    primaryColor: _instance.lightPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: _instance.lightPrimaryColor,
      foregroundColor: _instance.lightSecondaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        //systemNavigationBar
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: _instance.lightPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        //statusBar
        systemStatusBarContrastEnforced: true,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: _instance.lightPrimaryColor),
    navigationRailTheme: NavigationRailThemeData(backgroundColor: _instance.lightPrimaryColor),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _instance.accentColor,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: _instance.darkPrimaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: _instance.darkPrimaryColor,
      foregroundColor: _instance.darkSecondaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        //systemNavigationBar
        systemNavigationBarColor: _instance.darkPrimaryColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        //statusBar
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(backgroundColor: _instance.darkPrimaryColor),
    navigationRailTheme: NavigationRailThemeData(backgroundColor: _instance.darkPrimaryColor),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _instance.accentColor,
    ),
  );
}

Themes _instance = Themes();

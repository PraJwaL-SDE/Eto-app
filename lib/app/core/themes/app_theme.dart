import 'package:eto_ride/app/core/constant/colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class AppThemes {
  static final lightTheme = ThemeData(
    primaryColor: ConstantColors.primary,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Baloo_2",
    appBarTheme:  AppBarTheme(
      backgroundColor: ConstantColors.primary,
      foregroundColor: Colors.white,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(color: Colors.black, fontSize: 40, fontWeight: FontWeight.w700), // Boldest
      headlineMedium: TextStyle(color: Colors.black, fontSize: 36, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(color: Colors.black, fontSize: 28, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.w400),
      titleSmall: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      bodyMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
      bodySmall: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
      labelLarge: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
      labelSmall: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w300),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ConstantColors.primary,
        foregroundColor: Colors.white,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ConstantColors.primary,
      ),
    ),
  );



// Add more themes as needed
}
import 'package:collabrats_mobile/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 18,
        color: AppColors.blackColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 14,
        color: AppColors.blackColor,
      ),
      bodySmall: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 11,
        color: AppColors.blackColor,
      ),
      headlineLarge: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 25,
        fontWeight: FontWeight.w700,
        color: AppColors.blackColor,
      ),
      headlineMedium: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 19,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      headlineSmall: TextStyle(
        fontFamily: "Plus Jakarta Sans",
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColors.blackColor,
      ),
      titleLarge: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 21,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
      titleSmall: TextStyle(
        fontFamily: "Nunito Sans",
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.blackColor,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.blackColor,
    ),
    scaffoldBackgroundColor: AppColors.whiteColor,
    primaryColor: AppColors.blueColor,
  );
}

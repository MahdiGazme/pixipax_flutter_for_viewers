import 'package:flutter/material.dart';

import '../custom_theme.dart';

class CustomTextStyle {
  CustomTextStyle._();

  static TextTheme get getStyle => TextTheme(
        displayLarge: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 34,
          fontWeight: FontWeight.w600,
        ),
        displayMedium: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
        displaySmall: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineLarge: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        headlineMedium: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        headlineSmall: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        titleMedium: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        bodyLarge: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: customTheme.textColor,
          fontFamily: customTheme.fontFamilyPrimary,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      );
}

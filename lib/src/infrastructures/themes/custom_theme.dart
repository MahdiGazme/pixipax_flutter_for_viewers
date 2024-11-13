import 'package:flutter/material.dart';

class CustomTheme {
  MaterialColor get primaryColor => _lightPrimaryColor();

  MaterialColor _lightPrimaryColor() => const MaterialColor(0xff4B63EA, {
        50: Color(0xffedeffd),
        100: Color(0xffdbe0fb),
        200: Color(0xffc9d0f9),
        300: Color(0xffb7c1f7),
        400: Color(0xffa5b1f5),
        500: Color(0xff93a1f2),
        600: Color(0xff8192f0),
        700: Color(0xff6f82ee),
        800: Color(0xff5d73ec),
        900: Color(0xff4b63ea),
      });

  MaterialColor get textColor => const MaterialColor(0xFF020202, {
        50: Color(0xFFFFFFFF),
        100: Color(0xFFF4F4F4),
        200: Color(0xFFD3D3DB),
        300: Color(0xFFABABB6),
        400: Color(0xFF747482),
        500: Color(0xFF56565F),
        600: Color(0xFF2C2C38),
        700: Color(0xFF19191F),
        800: Color(0xFF0D0D11),
        900: Color(0xFF0A0A0C),
      });

  Color get secondaryColor => const Color(0xFF9434E8);

  Color get buttonColor => const Color(0xFF2675FF);

  Color get accentColor => const Color(0xFFF69631);

  Color get infoColor => const Color(0xFF5A5C98);

  Color get successColor => const Color(0xFF00D260);

  Color get warningColor => const Color(0xFFFFBB0D);

  Color get dangerColor => const Color(0xFFD01347);

  Color get disabledColor => const Color(0xFFA4A4A4);

  Color get backgroundColor => const Color(0xFFFFFFFF);

  Color get bottomSheetBackgroundColor => const Color(0xFFF4F4F4);

  final String fontFamilyPrimary = 'YekanBakh';
  final double borderRadiusRectangle = 2.0;
  final double borderRadiusCircular = 100;
  final double borderRadiusRound = 20.0;
  final double borderRadiusSemiRound = 11.0;
}

final customTheme = CustomTheme();

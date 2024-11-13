import 'package:flutter/material.dart';

import '../custom_theme.dart';
import 'text_style.dart';

class WideElevatedButtonStyle {
  WideElevatedButtonStyle._();

  static ElevatedButtonThemeData getStyle(
    final BuildContext context,
  ) =>
      ElevatedButtonThemeData(
        style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(
              const Size(311, 50),
            ),
            minimumSize: MaterialStateProperty.all(
              const Size(280, 50),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(customTheme.borderRadiusSemiRound),
                ),
              ),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              customTheme.textColor.shade50,
            ),
            backgroundColor: MaterialStateProperty.all(
              customTheme.buttonColor,
            ),
            textStyle: MaterialStatePropertyAll(
              CustomTextStyle.getStyle.labelLarge,
            ),
            enableFeedback: true,
            elevation: const MaterialStatePropertyAll(0.0)),
      );
}

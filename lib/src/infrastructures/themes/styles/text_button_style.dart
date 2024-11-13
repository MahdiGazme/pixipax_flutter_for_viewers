import 'package:flutter/material.dart';

import '../custom_theme.dart';

class TextButtonStyle {
  TextButtonStyle._();

  static TextButtonThemeData getStyle(
    final BuildContext context,
  ) =>
      TextButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  customTheme.borderRadiusRound,
                ),
              ),
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w600),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            customTheme.primaryColor,
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (final states) {
              if (states.contains(MaterialState.pressed)) {
                return customTheme.textColor.shade100;
              } else if (states.contains(MaterialState.disabled)) {
                return customTheme.primaryColor.shade300;
              }
              return null; // Use the component's default.
            },
          ),
          enableFeedback: true,
          elevation: const MaterialStatePropertyAll(0.0),
        ),
      );
}

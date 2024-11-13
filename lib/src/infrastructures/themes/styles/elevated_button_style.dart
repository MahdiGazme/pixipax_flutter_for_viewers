import 'package:flutter/material.dart';

import '../../utils/constants/utils.dart';
import '../custom_theme.dart';

class ElevatedButtonStyle {
  ElevatedButtonStyle._();

  static ElevatedButtonThemeData getStyle(
    final BuildContext context,
  ) =>
      ElevatedButtonThemeData(
        //TODO: refactor and find a way to support all 3 different designs for buttons
        style: ButtonStyle(
          maximumSize: const MaterialStatePropertyAll(
            Size(
              133,
              48,
            ),
          ),
          minimumSize: const MaterialStatePropertyAll(
            Size(
              50,
              35,
            ),
          ),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  customTheme.borderRadiusCircular,
                ),
              ),
            ),
          ),
          textStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.labelMedium,
          ),
          foregroundColor: MaterialStateProperty.resolveWith(
            (final states) {
              if (states.contains(MaterialState.disabled)) {
                return customTheme.buttonColor.withOpacity(0.5);
              } else {
                return customTheme.textColor.shade50;
              }
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith(
            (final states) {
              if (states.contains(MaterialState.disabled)) {
                return customTheme.buttonColor.withOpacity(0.1);
              } else {
                return customTheme.buttonColor;
              }
            },
          ),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: utils.mediumSpace,
            ),
          ),
          // enableFeedback: true,
          elevation: const MaterialStatePropertyAll(0.0),
        ),
      );
}

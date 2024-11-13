import 'package:flutter/material.dart';

import '../../utils/constants/utils.dart';
import '../custom_theme.dart';

class OtpTextFieldStyle {
  OtpTextFieldStyle._();

  static InputDecorationTheme getStyle(final BuildContext context) =>
      InputDecorationTheme(
        fillColor: customTheme.textColor.shade100,
        filled: false,
        contentPadding: utils.smallPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusSemiRound,
            ),
          ),
          borderSide: BorderSide(
            color: customTheme.textColor.withOpacity(0.1),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(customTheme.borderRadiusSemiRound),
          ),
          borderSide: BorderSide(
            color: customTheme.primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(customTheme.borderRadiusSemiRound),
          ),
          borderSide: BorderSide(
            color: customTheme.dangerColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(customTheme.borderRadiusSemiRound),
          ),
        ),
        errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.dangerColor,
            ),
        hintStyle: Theme.of(context).textTheme.displayMedium!.copyWith(
              color: customTheme.textColor.withOpacity(
                0.2,
              ),
            ),
        errorMaxLines: 1,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      );
}

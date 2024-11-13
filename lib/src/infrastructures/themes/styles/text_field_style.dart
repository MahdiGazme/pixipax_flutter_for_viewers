import 'package:flutter/material.dart';

import '../../utils/constants/utils.dart';
import '../custom_theme.dart';

class TextFieldStyle {
  TextFieldStyle._();

  static InputDecorationTheme getStyle(final BuildContext context) =>
      InputDecorationTheme(
        fillColor: customTheme.textColor.shade100,
        filled: true,
        contentPadding: utils.smallPadding,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusSemiRound,
            ),
          ),
          borderSide: BorderSide(
            color: customTheme.textColor.shade100,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(customTheme.borderRadiusSemiRound),
          ),
          borderSide: BorderSide(
            color: customTheme.textColor.shade100,
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
        prefixIconColor: customTheme.textColor.shade300,
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
          color: customTheme.textColor.shade300,
        ),
        counterStyle: Theme.of(context).textTheme.bodySmall,
        errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.dangerColor,
            ),
        errorMaxLines: 1,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      );
}

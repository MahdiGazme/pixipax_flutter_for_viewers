import 'package:flutter/material.dart';

import '../../utils/constants/utils.dart';
import '../custom_theme.dart';

class SearchTextFieldStyle {
  SearchTextFieldStyle._();

  static InputDecorationTheme getStyle(final BuildContext context) =>
      InputDecorationTheme(
        prefixIconColor: customTheme.disabledColor,
        filled: true,
        contentPadding: utils.smallPadding,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusCircular,
            ),
          ),
          borderSide: BorderSide(
            color: customTheme.textColor.shade100,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusCircular,
            ),
          ),
          borderSide: BorderSide(
            color: customTheme.textColor.shade100,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusCircular,
            ),
          ),
          borderSide: BorderSide(
            color: customTheme.dangerColor,
          ),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              customTheme.borderRadiusCircular,
            ),
          ),
        ),
        alignLabelWithHint: true,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: customTheme.disabledColor,
            ),
        counterStyle: Theme.of(context).textTheme.bodySmall,
        errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.dangerColor,
            ),
        errorMaxLines: 1,
        labelStyle: Theme.of(context).textTheme.bodyMedium,
      );
}

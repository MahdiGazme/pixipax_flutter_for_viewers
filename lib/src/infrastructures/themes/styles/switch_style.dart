import 'package:flutter/material.dart';

import '../custom_theme.dart';

class SwitchStyle {
  SwitchStyle._();

  static SwitchThemeData getStyle(final BuildContext context) =>
      SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith(
          (final states) {
            if (states.contains(MaterialState.selected)) {
              return customTheme.textColor.shade50;
            } else {
              return customTheme.primaryColor.shade900;
            }
          },
        ),
        trackColor: MaterialStateProperty.resolveWith(
          (final states) {
            if (states.contains(MaterialState.selected)) {
              return customTheme.primaryColor;
            } else {
              return customTheme.textColor.shade50;
            }
          },
        ),
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (final states) {
            if (states.contains(MaterialState.selected)) {
              return customTheme.primaryColor;
            } else {
              return customTheme.primaryColor.shade900;
            }
          },
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        trackOutlineWidth: const MaterialStatePropertyAll(2),
      );
}

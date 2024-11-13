import 'package:flutter/material.dart';

import '../custom_theme.dart';

class DividerStyle {
  DividerStyle._();

  static DividerThemeData getStyle(final BuildContext context) =>
      DividerThemeData(
        color: customTheme.textColor.shade300,
        space: 25,
      );
}

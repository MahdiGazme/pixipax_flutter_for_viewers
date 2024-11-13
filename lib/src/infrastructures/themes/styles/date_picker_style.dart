import 'package:flutter/material.dart';

import '../custom_theme.dart';

class DatePickerStyle {
  DatePickerStyle._();

  static DatePickerThemeData getStyle(final BuildContext context) =>
      DatePickerThemeData(
        backgroundColor: customTheme.backgroundColor,
        headerBackgroundColor: customTheme.primaryColor,
        headerForegroundColor: customTheme.textColor.shade50,
        weekdayStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.primaryColor.shade500,
            ),
      );
}

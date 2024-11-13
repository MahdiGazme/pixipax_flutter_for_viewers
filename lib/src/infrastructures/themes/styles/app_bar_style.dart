import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../custom_theme.dart';

class AppBarStyle {
  AppBarStyle._();

  static AppBarTheme getStyle(final BuildContext context) => AppBarTheme(
        backgroundColor: Colors.transparent,
        titleSpacing: 0.0,
        centerTitle: true,
        elevation: 0.0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
          systemNavigationBarContrastEnforced: false,
          systemNavigationBarIconBrightness:
              Theme.of(context).brightness == Brightness.light
                  ? Brightness.dark
                  : Brightness.light,
          statusBarColor: Colors.transparent,
          // Status bar
        ),
        iconTheme: IconThemeData(
          color: customTheme.textColor.shade300,
        ),
        toolbarTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customTheme.textColor.shade300,
            ),
        actionsIconTheme: IconThemeData(
          color: customTheme.textColor,
        ),
        titleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: customTheme.textColor,
            ),
        foregroundColor: customTheme.textColor.shade400,
      );
}

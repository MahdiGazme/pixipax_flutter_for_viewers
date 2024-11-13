import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NestedNavigationHandler {
  Route<dynamic>? generator(final NestedNavigationModel value) {
    final route = value.nestedPages.firstWhereOrNull(
        (final element) => element.routeName == value.settings.name);

    if (route != null) {
      return route;
    } else if (value.settings.name == value.initialRoute) {
     return MaterialPageRoute(
        builder: (final context) => value.mainPage,
      );
    }

    return null;
  }
}

class NestedNavigationModel {
  final String initialRoute;
  final RouteSettings settings;
  final Widget mainPage;
  final List<GetPageRoute<dynamic>> nestedPages;

  NestedNavigationModel({
    required this.mainPage,
    required this.initialRoute,
    required this.settings,
    required this.nestedPages,
  });
}

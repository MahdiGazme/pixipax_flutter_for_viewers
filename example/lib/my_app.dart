import 'package:example/widget/text_field_focus_controller_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_booof_module/flutter_booof_module.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => GetMaterialApp(
        title: 'PixiPax',
        getPages: [...routePages.pages],
        builder: (final context, final widget) =>
            TextFieldFocusControllerWidget(child: widget),
        defaultTransition: Transition.fadeIn,
        initialRoute: routePages.initialRoute,
        debugShowCheckedModeBanner: false,
        // translations: LocalizationService(),
        textDirection: TextDirection.ltr,
        locale: const Locale('en', 'US'),
        theme: CustomThemeData.getTheme(context),
      );
}

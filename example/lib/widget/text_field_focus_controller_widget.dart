import 'package:flutter/material.dart';

class TextFieldFocusControllerWidget extends StatelessWidget {
  final Widget? child;

  const TextFieldFocusControllerWidget({this.child, super.key});

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () {
          final FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: child,
      );
}

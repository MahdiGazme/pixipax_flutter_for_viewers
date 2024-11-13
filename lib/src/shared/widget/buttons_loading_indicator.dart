import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../enums/widget_state_enum.dart';

class ButtonLoadingIndicator extends StatelessWidget {
  final WidgetStateEnum state;

  const ButtonLoadingIndicator({
    this.state = WidgetStateEnum.primary,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Center(
        child: LoadingAnimationWidget.staggeredDotsWave(
          color: state == WidgetStateEnum.primary
              ? customTheme.textColor.shade50
              : customTheme.textColor,
          size: 30,
        ),
      );
}

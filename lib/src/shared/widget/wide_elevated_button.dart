import 'package:flutter/material.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/themes/styles/wide_elevated_button_style.dart';
import '../../infrastructures/utils/constants/utils.dart';
import '../enums/widget_state_enum.dart';
import 'buttons_loading_indicator.dart';

class WideElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final bool showLoading;
  final String title;
  final WidgetStateEnum state;

  const WideElevatedButton({
    required this.onPressed,
    required this.title,
    this.showLoading = false,
    this.state = WidgetStateEnum.primary,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Theme(
        data: ThemeData(
          elevatedButtonTheme: WideElevatedButtonStyle.getStyle(
            context,
          ),
        ),
        child: _body(context),
      );

  Widget _body(final BuildContext context) => Padding(
        padding: _edgeInsets(),
        child: ElevatedButton(
          style: _style(),
          onPressed: showLoading ? null : () => _onTap(context),
          child: showLoading ? _loadingWidget() : _title(),
        ),
      );

  void _onTap(final BuildContext context) {
    final FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    onPressed();
  }

  EdgeInsets _edgeInsets() => EdgeInsets.symmetric(
        horizontal: utils.mediumSpace,
      );

  Widget _title() => Text(
        title,
      );

  Widget _loadingWidget() => ButtonLoadingIndicator(
        state: state,
      );

  ButtonStyle _style() => ElevatedButton.styleFrom(
        foregroundColor:
            state == WidgetStateEnum.primary ? null : customTheme.textColor,
        backgroundColor: state == WidgetStateEnum.primary
            ? null
            : customTheme.textColor.shade100,
      );
}

import 'package:flutter/material.dart';

import '../../../../../infrastructures/themes/custom_theme.dart';
import '../../../../../infrastructures/utils/constants/utils.dart';

class SignUpPageAgreementWidget extends StatelessWidget {
  final void Function(bool value) onChanged;
  final bool value;

  const SignUpPageAgreementWidget({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _radio(),
          utils.smallHorizontalSpacer,
          _richText(context),
        ],
      );

  Widget _richText(final BuildContext context) => Expanded(
        child: RichText(
          text: _textSpans(context),
        ),
      );

  TextSpan _textSpans(final BuildContext context) => TextSpan(
        children: [
          _regularTextSpan(
            context,
            'I agree to the',
          ),
          _boldTextSpan(
            context,
            ' Terms & Conditions',
          ),
          _regularTextSpan(
            context,
            ' and',
          ),
          _boldTextSpan(
            context,
            ' Privacy & Policy',
          ),
        ],
      );

  TextSpan _boldTextSpan(
    final BuildContext context,
    final String text,
  ) =>
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor,
            ),
      );

  TextSpan _regularTextSpan(
    final BuildContext context,
    final String text,
  ) =>
      TextSpan(
        text: text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Radio<bool> _radio() => Radio(
        value: true,
        groupValue: value,
        onChanged: (final value) => onChanged.call(
          value ?? false,
        ),
        toggleable: true,
      );
}

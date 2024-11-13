import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../infrastructures/themes/styles/otp_text_field_style.dart';
import '../../../infrastructures/utils/constants/utils.dart';

class OtpTextFieldItem extends StatelessWidget {
  final TextEditingController controller;

  // final TextEditingController? nextController;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(
    BuildContext context,
    String value,
  )? onChanged;
  final InputDecoration? decoration;
  final bool autoFocus;
  final bool isLastItem;

  final String? Function(String? value)? validator;

  const OtpTextFieldItem({
    required this.controller,
    this.decoration,
    this.focusNode,
    this.onTap,
    this.onChanged,
    this.validator,
    this.autoFocus = false,
    this.isLastItem = false,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          inputDecorationTheme: OtpTextFieldStyle.getStyle(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: utils.tinySpace),
          child: TextFormField(
            controller: controller,
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
            showCursor: false,
            focusNode: focusNode,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: decoration,
            keyboardType: TextInputType.number,
            validator: validator,
            onTap: onTap,
            onChanged: (final value) => onChanged?.call(
              context,
              value,
            ),
          ),
        ),
      );
}

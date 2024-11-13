import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../infrastructures/themes/custom_theme.dart';
import '../../infrastructures/utils/constants/utils.dart';

class PrimaryTextField extends StatelessWidget {
  final String topLabel;
  final String? bottomHint;
  final String? hint;
  final Widget? counter;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final bool obscureText;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;

  const PrimaryTextField({
    required this.topLabel,
    this.onTap,
    this.hint,
    this.maxLength,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
    this.readOnly = false,
    this.bottomHint,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.counter,
    this.prefixIcon,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _label(context),
          utils.tinyVerticalSpacer,
          _textField(),
          if (bottomHint != null) _hintField(context),
        ],
      );

  Widget _textField() => TextFormField(
        cursorColor: customTheme.textColor,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        onTap: onTap,
        maxLength: maxLength,
        controller: controller,
        validator: validator,
        readOnly: readOnly,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          counter: counter,
        ),
      );

  Widget _label(final BuildContext context) => Text(
        topLabel,
        style: Theme.of(context).textTheme.headlineSmall,
      );

  Widget _hintField(final BuildContext context) => Column(
        children: [
          utils.tinyVerticalSpacer,
          _hintText(context),
        ],
      );

  Widget _hintText(final BuildContext context) => Text(
        bottomHint!,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );
}

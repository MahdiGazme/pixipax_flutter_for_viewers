import 'package:flutter/material.dart';

import 'primary_text_field.dart';

class PhoneNumberTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value) validator;
  final String? bottomHint;

  const PhoneNumberTextField({
    required this.controller,
    required this.validator,
    super.key,
    this.bottomHint,
  });

  @override
  Widget build(final BuildContext context) => PrimaryTextField(
        topLabel: 'Phone Number',
        controller: controller,
        keyboardType: TextInputType.phone,
        validator: validator,
        bottomHint: bottomHint,
      );
}

import 'package:flutter/material.dart';

import 'primary_text_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String? value) validator;

  const EmailTextField({
    required this.controller,
    required this.validator,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => PrimaryTextField(
        topLabel: 'Email',
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        validator: validator,
      );
}

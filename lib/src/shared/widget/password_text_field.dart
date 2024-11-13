import 'package:flutter/cupertino.dart';

import '../../infrastructures/utils/constants/utils.dart';
import 'primary_text_field.dart';

class PasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(bool value)? onObscuredChanged;
  final bool isHided;

  const PasswordTextField({
    required this.controller,
    this.onObscuredChanged,
    this.isHided = true,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => PrimaryTextField(
        controller: controller,
        obscureText: isHided,
        validator: utils.passwordValidator,
        topLabel: 'Password',
        suffixIcon: _showHidePassword(),
        hint: 'At least 8 characters contains letters and numbers',
      );

  Widget _showHidePassword() => GestureDetector(
        onTap: onObscuredChanged != null
            ? () => onObscuredChanged!.call(!isHided)
            : null,
        child: isHided
            ? const Icon(
                CupertinoIcons.eye_slash,
              )
            : const Icon(
                CupertinoIcons.eye,
              ),
      );
}

import 'package:flutter/services.dart';

class CreditCardInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    final TextEditingValue oldValue,
    final TextEditingValue newValue,
  ) {
    final String cleaned = newValue.text.replaceAll(RegExp(r'\s'), '');

    String result = '';
    for (int i = 0; i < cleaned.length; i += 4) {
      final end = i + 4;
      if (end <= cleaned.length) {
        result += '${cleaned.substring(i, end)} ';
      } else {
        result += cleaned.substring(i);
      }
    }

    return newValue.copyWith(
      text: result.trim(),
      selection: TextSelection.collapsed(offset: result.length),
    );
  }
}

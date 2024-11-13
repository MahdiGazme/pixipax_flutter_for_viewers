import 'package:flutter/material.dart';

import '../../../shared/models/string_decimal_number_wiew_model.dart';

class CustomUtils {
  Size getTextSize(final String text, final TextStyle style) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: style),
        maxLines: 1,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: double.infinity);
    return textPainter.size;
  }

  StringDecimalNumberViewModel doubleToStringDecimalViewModel(
    final double number,
  ) {
    final parts = number.toString().split('.');
    String decimal = '';
    if (parts.last.isNotEmpty) {
      decimal = parts.last.length < 2
          ? '.${parts.last}0'
          : '.${parts.last.substring(
              0,
              2,
            )}';
    } else {
      decimal = '00';
    }

    return StringDecimalNumberViewModel(parts.first, decimal);
  }
}

final customUtils = CustomUtils();

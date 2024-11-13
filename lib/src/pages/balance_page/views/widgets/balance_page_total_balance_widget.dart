import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../shared/models/string_decimal_number_wiew_model.dart';

class BalancePageTotalBalanceWidget extends StatelessWidget {
  final Animation<double> animation;
  final StringDecimalNumberViewModel totalBalance;
  final double maxHeight;
  final Size Function(String text, TextStyle style) calculateTextSize;

  const BalancePageTotalBalanceWidget({
    required this.animation,
    required this.totalBalance,
    required this.maxHeight,
    required this.calculateTextSize,
    super.key,
  });

  @override
  Widget build(
    final BuildContext context,
  ) =>
      Positioned.fill(
        top: Tween<double>(
          begin: kToolbarHeight,
          end: maxHeight / 2,
        ).evaluate(animation),
        child: _totalBalance(),
      );

  Widget _totalBalance() => Align(
        alignment: AlignmentDirectional.center,
        child: RichText(
          text: TextSpan(
            children: [
              _price(),
              _decimalPrice(),
            ],
          ),
        ),
      );

  TextSpan _decimalPrice() => TextSpan(
        text: totalBalance.decimal,
        style: _decimalTextTheme(),
      );

  TextSpan _price() => TextSpan(
        text: totalBalance.nonDecimal,
        style: _mainStyle(),
      );

  TextStyle _mainStyle() => TextStyle(
        fontSize: _fontSize(animation),
        color: customTheme.textColor.shade50,
        fontWeight: FontWeight.w600,
      );

  TextStyle _decimalTextTheme() => TextStyle(
        fontSize: _fontSize(animation),
        color: customTheme.textColor.shade50.withOpacity(
          0.6,
        ),
        fontWeight: FontWeight.w600,
      );

  double _fontSize(
    final Animation<double> animation,
  ) =>
      Tween<double>(
        begin: 36,
        end: 55,
      ).evaluate(animation);
}

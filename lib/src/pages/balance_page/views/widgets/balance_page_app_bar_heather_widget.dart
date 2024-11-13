import 'package:flutter/material.dart';

import '../../../../infrastructures/utils/constants/custom_utils.dart';
import 'balance_page_total_balance_widget.dart';

class BalancePageAppBarHeader extends StatelessWidget {
  final double totalBalance;
  final double maxHeight;
  final double minHeight;
  final double Function(BoxConstraints constaints) calculateExpandRatio;

  const BalancePageAppBarHeader({
    required this.maxHeight,
    required this.minHeight,
    required this.calculateExpandRatio,
    required this.totalBalance,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => LayoutBuilder(
        builder: (final context, final constraints) {
          final expandRatio = calculateExpandRatio(constraints);
          final animation = AlwaysStoppedAnimation(expandRatio);
          return Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              _buildTitle(context, animation),
            ],
          );
        },
      );

  Widget _buildTitle(
          final BuildContext context, final Animation<double> animation) =>
      BalancePageTotalBalanceWidget(
        animation: animation,
        calculateTextSize: customUtils.getTextSize,
        totalBalance: customUtils.doubleToStringDecimalViewModel(totalBalance),
        maxHeight: maxHeight,
      );
}

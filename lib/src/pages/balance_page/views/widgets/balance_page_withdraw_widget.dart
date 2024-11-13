import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';

class BalancePageWithdrawWidget extends StatelessWidget {
  final void Function() onTap;

  const BalancePageWithdrawWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 48,
          margin: utils.mediumPadding,
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Material(
        shape: _shape(),
        child: _child(context),
      );

  Widget _child(final BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
        onTap: onTap,
        child: Padding(
          padding: utils.smallPadding,
          child: _title(context),
        ),
      );

  Widget _title(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _text(context),
          utils.smallHorizontalSpacer,
          _icon(),
        ],
      );

  Widget _icon() => const Icon(
        Icons.download,
        size: 14,
      );

  Widget _text(final BuildContext context) => Text(
        'Withdraw',
        style: Theme.of(context).textTheme.labelLarge,
      );

  RoundedRectangleBorder _shape() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
      );
}

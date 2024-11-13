import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_asset_image.dart';

class BalancePageAddCreditCardWidget extends StatelessWidget {
  final void Function() onTap;

  const BalancePageAddCreditCardWidget({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Container(
        margin: utils.mediumPadding,
        decoration: _decoration(),
        child: Padding(
          padding: utils.smallPadding,
          child: Row(
            children: [
              _card(),
              utils.mediumHorizontalSpacer,
              _descriptions(context),
              _button(context),
            ],
          ),
        ),
      );

  Widget _card() => CustomAssetImage(
        path: assetPaths.creditCard,
        height: 18,
      );

  Widget _descriptions(final BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _mainDescription(context),
            _hint(context),
          ],
        ),
      );

  Widget _hint(final BuildContext context) => Text(
        'This is not published yet',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.shade50,
            ),
      );

  Widget _mainDescription(final BuildContext context) => Text(
        'This is not published yet',
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: customTheme.textColor.shade50,
              fontWeight: FontWeight.w600,
            ),
      );

  Widget _button(final BuildContext context) => ElevatedButton(
        style: _buttonStyle(),
        onPressed: onTap,
        child: _buttonBody(),
      );

  Widget _buttonBody() => const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Add Card',
          ),
          Icon(
            Icons.arrow_forward_rounded,
            size: 12,
          )
        ],
      );

  ButtonStyle _buttonStyle() => ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(customTheme.backgroundColor),
        foregroundColor: MaterialStatePropertyAll(customTheme.textColor),
      );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.backgroundColor.withOpacity(
          0.15,
        ),
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusSemiRound,
        ),
      );
}

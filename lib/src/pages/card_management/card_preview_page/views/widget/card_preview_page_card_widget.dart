import 'package:flutter/material.dart';

import '../../../../../infrastructures/themes/custom_theme.dart';
import '../../../../../infrastructures/utils/constants/utils.dart';
import '../../models/card_preview_view_model.dart';

class CardPreviewPageCardWidget extends StatelessWidget {
  final CardPreviewViewModel item;
  final void Function() onChangeCardTap;

  const CardPreviewPageCardWidget({
    required this.item,
    required this.onChangeCardTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: _decoration(),
        child: Padding(
          padding: utils.mediumPadding,
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          utils.mediumVerticalSpacer,
          _cardInfo(context),
          utils.giantVerticalSpacer,
          _button(),
        ],
      );

  Widget _button() => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: ElevatedButton(
          onPressed: onChangeCardTap,
          child: const Text('Change card'),
        ),
      );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.textColor.shade100,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusRound,
        ),
      );

  Text _title(final BuildContext context) => Text(
        'Your active card',
        style: Theme.of(context).textTheme.titleSmall,
      );

  Widget _cardInfo(final BuildContext context) => Row(
        children: [
          _shortNumber(context),
          utils.giantHorizontalSpacer,
          _expireDate(context),
        ],
      );

  Text _expireDate(final BuildContext context) => Text(
        'Expiration: ${item.expireDate}',
        style: _cardInfoTextStyle(context),
      );

  Text _shortNumber(final BuildContext context) => Text(
        '**** **** **** ${item.shortCardNumber}',
        style: _cardInfoTextStyle(context),
      );

  TextStyle _cardInfoTextStyle(final BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: customTheme.textColor.shade400,
          );
}

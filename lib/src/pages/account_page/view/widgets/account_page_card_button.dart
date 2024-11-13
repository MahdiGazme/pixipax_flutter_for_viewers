import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/asset_paths.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/custom_asset_image.dart';

class AccountPageCardButton extends StatelessWidget {
  final void Function() onTap;

  const AccountPageCardButton({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: _decoration(),
        child: _body(context),
      );

  Material _body(final BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: _borderRadius(),
          child: Stack(
            children: [
              _bodyDetails(context),
              _map(),
            ],
          ),
        ),
      );

  Widget _map() => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: utils.mediumPadding,
          child: CustomAssetImage(
            path: assetPaths.map,
            height: 120,
          ),
        ),
      );

  Widget _bodyDetails(final BuildContext context) => Positioned.fill(
        child: Padding(
          padding: utils.largePadding,
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _icon(),
          utils.smallVerticalSpacer,
          _title(context),
          utils.tinyVerticalSpacer,
          _description(context),
        ],
      );

  CustomAssetImage _icon() => CustomAssetImage(
        path: assetPaths.creditCard,
        height: 20,
      );

  Widget _description(final BuildContext context) => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _descriptionTitle(context),
          utils.tinyHorizontalSpacer,
          _descriptionArrow(),
        ],
      );

  Widget _descriptionArrow() => Icon(
        Icons.arrow_forward_ios_rounded,
        size: 20,
        color: customTheme.textColor.shade50,
      );

  Widget _descriptionTitle(final BuildContext context) => Text(
        'please add a Credit card to\n withdraw your balance.',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: _titleStyle(context),
      );

  TextStyle _titleStyle(final BuildContext context) =>
      Theme.of(context).textTheme.labelSmall!.copyWith(
            color: customTheme.textColor.shade50,
          );

  Widget _title(final BuildContext context) => Text(
        'Card',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _descriptionStyle(context),
      );

  TextStyle _descriptionStyle(final BuildContext context) =>
      Theme.of(context).textTheme.labelLarge!.copyWith(
            color: customTheme.textColor.shade50,
          );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.primaryColor,
        borderRadius: _borderRadius(),
      );

  BorderRadius _borderRadius() => BorderRadius.circular(
        customTheme.borderRadiusRound,
      );
}

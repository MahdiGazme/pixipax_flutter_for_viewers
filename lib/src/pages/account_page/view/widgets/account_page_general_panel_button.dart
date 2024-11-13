import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';

class AccountPageGeneralPanelButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final String description;
  final IconData icon;

  const AccountPageGeneralPanelButton({
    required this.onTap,
    required this.title,
    required this.description,
    required this.icon,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(
            customTheme.borderRadiusSemiRound,
          ),
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Padding(
        padding: utils.mediumPadding,
        child: Row(
          children: [
            _icon(),
            utils.smallHorizontalSpacer,
            _details(context),
            _forwardIcon()
          ],
        ),
      );

  Widget _forwardIcon() => const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 21,
      );

  Widget _details(final BuildContext context) => Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            _description(context),
          ],
        ),
      );

  Widget _description(final BuildContext context) => Text(
        description,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _title(final BuildContext context) => Text(
        title,
        style: Theme.of(context).textTheme.labelMedium,
      );

  Widget _icon() => Icon(
        icon,
        size: 29,
      );
}

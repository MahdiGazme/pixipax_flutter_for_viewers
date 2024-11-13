import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';

class AccountPageLogOutButton extends StatelessWidget {
  final void Function() onTap;

  const AccountPageLogOutButton({
    required this.onTap,
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
          ],
        ),
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
        'Securely log out of Account',
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _title(final BuildContext context) => Text(
        'Log out',
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: customTheme.dangerColor,
            ),
      );

  Widget _icon() => Icon(
        Icons.logout_rounded,
        size: 29,
        color: customTheme.dangerColor,
      );
}

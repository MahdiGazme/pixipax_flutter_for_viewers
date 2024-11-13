import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import '../../../../shared/widget/milky_avatar_selector.dart';
import '../../models/account_details_view_model.dart';

class AccountPageProfileButton extends StatelessWidget {
  final AccountDetailsViewModel item;
  final void Function() onTap;

  const AccountPageProfileButton({
    required this.item,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => Material(
        color: customTheme.textColor.shade100,
        borderRadius: _borderRadius(),
        child: InkWell(
          onTap: onTap,
          borderRadius: _borderRadius(),
          child: _content(context),
        ),
      );

  Widget _content(final BuildContext context) => Padding(
        padding: utils.mediumPadding,
        child: Row(
          children: [
            _avatar(),
            utils.smallHorizontalSpacer,
            _details(context),
            _arrow(),
          ],
        ),
      );

  Icon _arrow() => const Icon(
        Icons.arrow_forward_ios_rounded,
      );

  Widget _avatar() => CustomAvatarSelector(
        src: item.avatarId,
        size: 58,
      );

  Widget _details(final BuildContext context) => Expanded(
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _name(context),
            utils.tinyVerticalSpacer,
            _email(context),
          ],
        ),
  );

  Widget _email(final BuildContext context) => Text(
        item.email,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: customTheme.textColor.shade400,
            ),
      );

  Widget _name(final BuildContext context) => Text(
        item.fullName,
        style: Theme.of(context).textTheme.titleSmall,
      );

  BorderRadius _borderRadius() => BorderRadius.circular(
        customTheme.borderRadiusRound,
      );
}

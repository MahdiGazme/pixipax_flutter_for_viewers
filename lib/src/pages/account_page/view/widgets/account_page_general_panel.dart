import 'package:flutter/material.dart';

import '../../../../infrastructures/themes/custom_theme.dart';
import '../../../../infrastructures/utils/constants/utils.dart';
import 'account_page_general_panel_button.dart';

class AccountPageGeneralPanel extends StatelessWidget {
  final void Function() onTermsOfUseTap;
  final void Function() onAuthenticationTap;
  final void Function() onNotificationsTap;

  const AccountPageGeneralPanel({
    required this.onTermsOfUseTap,
    required this.onAuthenticationTap,
    required this.onNotificationsTap,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => DecoratedBox(
        decoration: _decoration(),
        child: _content(context),
      );

  Column _content(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          utils.mediumVerticalSpacer,
          _title(context),
          _termsOfUse(),
          _authentication(),
          _notifications(),
        ],
      );

  BoxDecoration _decoration() => BoxDecoration(
        color: customTheme.textColor.shade100,
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusRound,
        ),
      );

  Widget _notifications() => AccountPageGeneralPanelButton(
        icon: Icons.notifications_outlined,
        onTap: onNotificationsTap,
        title: 'Notification',
        description: 'Customize your notification preferences',
      );

  Widget _authentication() => AccountPageGeneralPanelButton(
        icon: Icons.lock_outline_rounded,
        onTap: onAuthenticationTap,
        title: 'Authentication',
        description: 'Update and strengthen account security',
      );

  Widget _termsOfUse() => AccountPageGeneralPanelButton(
        icon: Icons.description_outlined,
        onTap: onTermsOfUseTap,
        title: 'Terms of use',
        description: 'Securely add payment method',
      );

  Widget _title(final BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: utils.smallSpace,
          horizontal: utils.mediumSpace,
        ),
        child: Text(
          'General',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      );
}

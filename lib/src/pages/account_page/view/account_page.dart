import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../../../shared/widget/page_state_provider.dart';
import '../controller/account_page_controller.dart';
import 'widgets/account_page_card_button.dart';
import 'widgets/account_page_general_panel.dart';
import 'widgets/account_page_log_out_button.dart';
import 'widgets/account_page_profile_button.dart';

class AccountPage extends GetView<AccountPageController> {
  const AccountPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBAr(),
        body: PageStateProvider(
          state: controller.state,
          onRetry: controller.getAccountDetails,
          page: () => _content(context),
        ),
      );

  Widget _content(final BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            _profileDetails(),
            utils.mediumVerticalSpacer,
            _cardButton(),
            utils.mediumVerticalSpacer,
            _generalPanel(),
            _logOut()
          ],
        ),
      );

  Widget _cardButton() => AccountPageCardButton(
        onTap: controller.onCardTap,
      );

  Widget _logOut() => AccountPageLogOutButton(
        onTap: controller.onLogOutTap,
      );

  Widget _generalPanel() => AccountPageGeneralPanel(
        onAuthenticationTap: controller.onAuthenticationTap,
        onNotificationsTap: controller.onNotificationsTap,
        onTermsOfUseTap: controller.onTermsOfUseTap,
      );

  Widget _profileDetails() => AccountPageProfileButton(
        item: controller.accountDetails,
        onTap: controller.onProfileTap,
      );

  CustomAppBar _appBAr() => CustomAppBar(
        title: const Text('ACCOUNT'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/constants/utils.dart';
import '../../../shared/widget/custom_app_bar.dart';
import '../../../shared/widget/custom_scaffold.dart';
import '../controller/notifications_setting_page_controller.dart';
import 'widget/notification_setting_switch_widget.dart';

class NotificationSettingPage
    extends GetView<NotificationsSettingPageController> {
  const NotificationSettingPage({super.key});

  @override
  Widget build(final BuildContext context) => CustomScaffold(
        appBar: _appBar(),
        body: _body(),
      );

  Widget _body() => Obx(
        () => Column(
          children: [
            utils.largeVerticalSpacer,
            _pushNotification(),
            utils.largeVerticalSpacer,
            _inAppMessaging(),
          ],
        ),
      );

  Widget _inAppMessaging() => NotificationSettingSwitchWidget(
        icon: Icons.notifications_none_rounded,
        title: 'In-App Messaging',
        description: 'This notice informs you about new updates and news.',
        value: controller.hasInAppMessaging.value,
        onChanged: ({required final value}) =>
            controller.hasInAppMessaging.value = value,
      );

  Widget _pushNotification() => NotificationSettingSwitchWidget(
        icon: Icons.notifications_none_rounded,
        title: 'Push notification ',
        description:
            'This notice informs you that there are jobs nearby on your lock screen.',
        value: controller.hasNotification.value,
        onChanged: ({required final value}) =>
            controller.hasNotification.value = value,
      );

  CustomAppBar _appBar() => CustomAppBar(
        title: const Text('NOTIFICATION'),
        nestedKey: nestedKeys.accountNestedKey,
      );
}

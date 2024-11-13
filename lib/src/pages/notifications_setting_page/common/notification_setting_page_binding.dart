import 'package:get/get.dart';

import '../controller/notifications_setting_page_controller.dart';

class NotificationSettingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      NotificationsSettingPageController.new,
    );
  }
}

import 'package:get/get.dart';

import '../../../infrastructures/router/route_names.dart';

class IntroductionPageController extends GetxController {
  void onCreateAnAccountTap() {
    Get.toNamed(routeNames.phoneConfirmation);
  }

  void onLoginTap() {
    Get.toNamed(routeNames.login);
  }
}

import 'package:get/get.dart';

import '../controller/authentication_page_controller.dart';

class AuthenticationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(AuthenticationPageController.new);
  }
}

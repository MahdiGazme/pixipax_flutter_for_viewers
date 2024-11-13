import 'package:get/get.dart';

import '../controller/introduction_page_controller.dart';

class IntroductionPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(IntroductionPageController.new);
  }
}

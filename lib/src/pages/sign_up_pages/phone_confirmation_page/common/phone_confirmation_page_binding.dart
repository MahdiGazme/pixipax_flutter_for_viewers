import 'package:get/get.dart';

import '../controller/phone_confirmation_page_controller.dart';
import '../repository/phone_confirmation_page_repository.dart';

class PhoneConfirmationPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => PhoneConfirmationPageController(
        PhoneConfirmationPageRepository(),
      ),
    );
  }
}

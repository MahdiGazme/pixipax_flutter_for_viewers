import 'package:get/get.dart';

import '../controller/confirmation_code_page_controller.dart';
import '../repository/confirmation_code_page_repository.dart';

class ConfirmationCodePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ConfirmationCodePageController(
        ConfirmationCodePageRepository(),
      ),
    );
  }
}

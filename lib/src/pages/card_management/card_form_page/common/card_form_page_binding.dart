import 'package:get/get.dart';

import '../controller/card_form_page_controller.dart';
import '../repository/card_form_page_repository.dart';

class CardFormPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CardFormPageController(
        CardFormPageRepository(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../controller/card_preview_page_controller.dart';
import '../repository/card_preview_page_repository.dart';

class CardPreviewPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => CardPreviewPageController(
        CardPreviewPageRepository(),
      ),
    );
  }
}

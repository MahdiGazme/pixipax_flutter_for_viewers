import 'package:get/get.dart';

import '../controller/electronic_signature_page_controller.dart';
import '../repository/electronic_signature_page_repository.dart';

class ElectronicSignaturePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ElectronicSignaturePageController(
        ElectronicSignaturePageRepository(),
      ),
    );
  }
}

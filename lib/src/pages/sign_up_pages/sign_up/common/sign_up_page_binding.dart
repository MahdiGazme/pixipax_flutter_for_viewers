import 'package:get/get.dart';

import '../controller/sign_up_page_controller.dart';
import '../repository/sign_up_page_repository.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => SignUpPageController(
        SignUpPageRepository(),
      ),
    );
  }
}

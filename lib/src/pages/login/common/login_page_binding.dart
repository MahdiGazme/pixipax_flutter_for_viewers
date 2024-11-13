import 'package:get/get.dart';

import '../controller/login_page_controller.dart';
import '../repository/login_page_repository.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginPageController(
        LoginPageRepository(),
      ),
    );
  }
}

import 'package:get/get.dart';

import '../controller/edit_profile_page_controller.dart';
import '../repository/edit_profile_page_repository.dart';

class EditProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => EditProfilePageController(
        EditProfilePageRepository(),
      ),
    );
  }
}

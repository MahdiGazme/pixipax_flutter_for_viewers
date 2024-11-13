import 'package:get/get.dart';

import '../controller/near_jobs_page_controller.dart';
import '../repository/near_jobs_page_repository.dart';

class NearJobsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => NearJobsPageController(
        NearJobsPageRepository(),
      ),
    );
  }
}

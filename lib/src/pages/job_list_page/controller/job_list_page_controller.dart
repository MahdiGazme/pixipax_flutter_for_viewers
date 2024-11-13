import 'dart:async';

import 'package:get/get.dart';
import 'package:location/location.dart';

import '../../../infrastructures/router/route_names.dart';
import '../../../infrastructures/utils/constants/nested_keys.dart';
import '../../../infrastructures/utils/list_view_handler.dart';
import '../../../infrastructures/utils/location_service_handler.dart';
import '../../../shared/enums/page_state_enum.dart';
import '../models/active_job_view_model.dart';
import '../models/job_list_item_view_model.dart';
import '../repository/job_list_page_repository.dart';

class JobListPageController extends GetxController {
  final JobListPageRepository _repository;

  JobListPageController(
    this._repository,
  );

  final state = PageStateEnum.loading.obs;

  ActiveJobViewModel? activeJob;

  final listViewHandler = ListViewHandler<AvailableJobsViewModel>(
    hasPagination: true,
  );

  final locationHandler = LocationServiceHandler();

  LocationData? locationData;

  @override
  void onInit() async {
    // locationData = await locationHandler.getPosition();
    await _getAllAvailableJobs();
    await _getActiveJob();
    super.onInit();
  }

  Future<void> _getActiveJob() async {
    state.value = PageStateEnum.loading;
    final resultOrException = await _repository.getActiveJob();
    resultOrException.fold(
      //TODO: as always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) {
        activeJob = ActiveJobViewModel(
          storeName:
              'This is a description about job and subtask of job bla bla.',
          totalSubtasks: 5,
          doneSubtasks: 2,
          location: 'Collingwood VIC, 26 Street',
          longitude: -1.382402,
          latitude: 54.901132,
        );
        state.value = PageStateEnum.success;
      },
      (final result) {
        activeJob = result;
        state.value = PageStateEnum.success;
      },
    );
  }

  void onNotificationsTap() {
    Get.toNamed(
      routeNames.electronicSignature,
      id: nestedKeys.jobsListNestedKey,
    );
  }

  Future<void> _getAllAvailableJobs() async {
    // listViewHandler.showLoading.value = true;
    final resultOrException = await _repository.getJobs(
      listViewHandler.query,
    );

    resultOrException.fold(
      //TODO: as always
      (final exception) {
        _simulator();
      },
      // (final exception) => listViewHandler.showLoading.value = false,
      (final result) {
        listViewHandler.onSuccess(
          items: result,
        );
        // listViewHandler.showLoading.value = false;
      },
    );
  }

  void onJobContinueTap() {
    //TODO: implement and remove navigation
    Get.toNamed(
      routeNames.nearJobs,
      id: nestedKeys.jobsListNestedKey,
    );
  }

  void _simulator() {
    listViewHandler.onSuccess(
      items: [
        AvailableJobsViewModel(
          deadLine: DateTime.now().add(
            const Duration(
              days: 20,
            ),
          ),
          storeName: 'BuzzFeed Vendor',
          description: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry...',
          estimate: 2,
          payment: 540.00,
          subtasks: 5,
          location: 'Collingwood VIC, 26 Street',
        ),
        AvailableJobsViewModel(
          deadLine: DateTime.now().add(
            const Duration(
              days: 20,
            ),
          ),
          storeName: 'BuzzFeed Vendor',
          description: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry...',
          estimate: 2,
          payment: 540.00,
          subtasks: 5,
          location: 'Collingwood VIC, 26 Street',
        ),
        AvailableJobsViewModel(
          deadLine: DateTime.now().add(
            const Duration(
              days: 20,
            ),
          ),
          storeName: 'BuzzFeed Vendor',
          description: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry...',
          estimate: 2,
          payment: 540.00,
          subtasks: 5,
          location: 'Collingwood VIC, 26 Street',
        ),
        AvailableJobsViewModel(
          deadLine: DateTime.now().add(
            const Duration(
              days: 20,
            ),
          ),
          storeName: 'BuzzFeed Vendor',
          description: 'Lorem Ipsum is simply dummy text of the printing and '
              'typesetting industry...',
          estimate: 2,
          payment: 540.00,
          subtasks: 5,
          location: 'Collingwood VIC, 26 Street',
        ),
      ],
    );
    // availableJobs.showLoading.value = false;
  }
}

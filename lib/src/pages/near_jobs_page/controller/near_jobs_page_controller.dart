import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../shared/enums/page_state_enum.dart';
import '../models/jobs_marker_view_model.dart';
import '../models/near_jobs_view_model.dart';
import '../repository/near_jobs_page_repository.dart';

class NearJobsPageController extends GetxController {
  final NearJobsPageRepository _repository;

  NearJobsPageController(this._repository);

  final position = Position(
    -1.382813,
    54.908383,
  ).obs;

  late MapboxMap mapController;

  final markers = <JobMarkersViewModel>[].obs;

  final state = PageStateEnum.loading.obs;

  final _pageChangeDuration = 500;

  final cameraZoom = 11.0;

  final _markerChangeDebouncer = Debouncer(
    delay: const Duration(
      milliseconds: 200,
    ),
  );

  final searchText = TextEditingController();

  RxString selectedJobId = ''.obs;

  final pageViewController = PageController(viewportFraction: 0.75);

  final jobList = <NearJobsViewModel>[].obs;

  @override
  void onInit() async {
    await getJobs();
    super.onInit();
  }

  Future<void> getJobs() async {
    state.value = PageStateEnum.loading;
    final resultOrException = await _repository.getAllNearJobs();

    resultOrException.fold(
      //TODO: like always
      // (final exception) => state.value = PageStateEnum.retry,
      (final exception) {
        _simulator();
      },
      (final result) {
        jobList.value = result;
        selectedJobId.value = result.first.id;
        state.value = PageStateEnum.success;
      },
    );
  }

  void onCameraPositionChanged(
      final CameraChangedEventData? cameraChangedEventData) async {
    for (final marker in markers) {
      final screenCoordinate = await mapController.pixelForCoordinate(
        Point(
          coordinates: Position(
            marker.longitude,
            marker.latitude,
          ),
        ).toJson(),
      );
      marker.screenPosition.value = screenCoordinate;
    }
  }

  void onMapCreated(final MapboxMap controller) async {
    mapController = controller;

    for (final element in jobList) {
      final screenCoordinate = await mapController.pixelForCoordinate(
        Point(
          coordinates: Position(
            element.longitude,
            element.latitude,
          ),
        ).toJson(),
      );
      markers.add(
        _createMarkerModel(
          element,
          screenCoordinate,
        ),
      );
    }
  }

  JobMarkersViewModel _createMarkerModel(
    final NearJobsViewModel element,
    final ScreenCoordinate screenCoordinate,
  ) =>
      JobMarkersViewModel(
        value: element.payment,
        screenPosition: ValueNotifier(screenCoordinate),
        id: element.id,
        latitude: element.latitude,
        longitude: element.longitude,
      );

  void onPageChanged(
    final int index,
  ) {
    _markerChangeDebouncer.call(() async {
      selectedJobId.value = jobList[index].id;
      _reorderMarkers(jobList[index].id);
      await _changeCameraPosition(index);
    });
  }

  void _reorderMarkers(final String id) {
    final index = markers.indexWhere((final element) => element.id == id);
    final marker = markers[index];
    markers.removeAt(index);
    markers.add(marker);
  }

  Future<void> _changeCameraPosition(final int index) async {
    await mapController.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(
            jobList[index].longitude,
            jobList[index].latitude,
          ),
        ).toJson(),
        zoom: cameraZoom,
      ),
      MapAnimationOptions(
        duration: 300,
      ),
    );
  }

  void onMarkerTaped(final String id) {
    final jobIndex = jobList.indexWhere(
      (final element) => element.id == id,
    );
    if (jobIndex != -1) {
      _animateToNextPage(jobIndex);
    }
  }

  void _animateToNextPage(final int jobIndex) {
    pageViewController.animateToPage(
      jobIndex,
      duration: Duration(
        milliseconds: _pageChangeDuration,
      ),
      curve: Curves.easeInOut,
    );
  }

  void onJobListItemTap(final String id) {}

  void _simulator() {
    jobList.value = [
      NearJobsViewModel(
        id: '1',
        payment: 510.0,
        estimate: 1,
        storeName: 'BuzzFeed Vendor',
        subtasks: 5,
        address: 'Collingwood VIC, 26 Street',
        deadLine: DateTime.now().add(const Duration(days: 10)),
        longitude: -1.425829,
        latitude: 54.907951,
        ),
      NearJobsViewModel(
        id: '2',
        payment: 520.0,
        estimate: 1,
        storeName: 'BuzzFeed Vendor',
        subtasks: 5,
        address: 'Collingwood VIC, 26 Street',
        deadLine: DateTime.now().add(const Duration(days: 10)),
        longitude: -1.425141,
        latitude: 54.887814,
        ),
      NearJobsViewModel(
        id: '3',
        payment: 530.0,
        estimate: 1,
        storeName: 'BuzzFeed Vendor',
        subtasks: 5,
        address: 'Collingwood VIC, 26 Street',
        deadLine: DateTime.now().add(const Duration(days: 10)),
        longitude: -1.380480,
        latitude: 54.925908,
        ),
      NearJobsViewModel(
        id: '4',
        payment: 540.0,
        estimate: 1,
        storeName: 'BuzzFeed Vendor',
        subtasks: 5,
        address: 'Collingwood VIC, 26 Street',
        deadLine: DateTime.now().add(const Duration(days: 10)),
        longitude: -1.374758,
        latitude: 54.925357,
        ),
      NearJobsViewModel(
        id: '5',
        payment: 550.0,
        estimate: 1,
        storeName: 'BuzzFeed Vendor',
        subtasks: 5,
        address: 'Collingwood VIC, 26 Street',
        deadLine: DateTime.now().add(const Duration(days: 10)),
        longitude: -1.384377,
        latitude: 54.912531,
        ),
    ];
    selectedJobId.value = '1';
    state.value = PageStateEnum.success;
  }
}

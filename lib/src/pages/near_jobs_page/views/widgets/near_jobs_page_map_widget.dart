import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../controller/near_jobs_page_controller.dart';

class NearJobsPageMapWidget extends GetView<NearJobsPageController> {
  const NearJobsPageMapWidget({
    super.key,
  });

  @override
  Widget build(final BuildContext context) => MapWidget(
        onMapCreated: controller.onMapCreated,
        resourceOptions: _resourceOptions(),
        onCameraChangeListener: controller.onCameraPositionChanged,
        cameraOptions: _cameraOptions(),
      );

  CameraOptions _cameraOptions() => CameraOptions(
        zoom: controller.cameraZoom,
        center: Point(
          coordinates: controller.position.value,
        ).toJson(),
      );

  ResourceOptions _resourceOptions() => ResourceOptions(
        accessToken:
            'sk.eyJ1IjoiYzRyYW1pcmV6IiwiYSI6ImNscHMyMjE2dTBqZnkyanFjMXhieGVmb2IifQ.l7rawK_4CZ9Z5e86aoNulw',
      );
}

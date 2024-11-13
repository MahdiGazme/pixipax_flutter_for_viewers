import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../../infrastructures/themes/custom_theme.dart';

class JobListPageActiveJobMapWidget extends StatelessWidget {
  final Position position;

  const JobListPageActiveJobMapWidget({
    required this.position,
    super.key,
  });

  @override
  Widget build(final BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(
          customTheme.borderRadiusRound,
        ),
        child: MapWidget(
          resourceOptions: ResourceOptions(
            //TODO: fix this token
            accessToken:
                'sk.eyJ1IjoiYzRyYW1pcmV6IiwiYSI6ImNscHMyMjE2dTBqZnkyanFjMXhieGVmb2IifQ.l7rawK_4CZ9Z5e86aoNulw',
          ),
          cameraOptions: CameraOptions(
            zoom: 15,
            center: Point(coordinates: position).toJson(),
          ),
        ),
      );
}

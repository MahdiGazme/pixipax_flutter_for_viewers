import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';


class JobMarkersViewModel {
  final double value;
  final ValueNotifier<ScreenCoordinate> screenPosition;
  final String id;
  final num latitude;
  final num longitude;

  JobMarkersViewModel({
    required this.value,
    required this.screenPosition,
    required this.id,
    required this.latitude,
    required this.longitude,
  });
}

import 'package:location/location.dart';

class LocationServiceHandler {
  Location location = Location();

  Future<void> _enable() async {
    final bool serviceEnabled;

    serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }
  }

  Future<void> _getPermission() async {
    PermissionStatus permission;

    permission = await location.hasPermission();
    if (permission == PermissionStatus.denied) {
      permission = await location.requestPermission();
      if (permission == PermissionStatus.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == PermissionStatus.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied,'
        ' we cannot request permissions.',
      );
    }
  }

  Future<LocationData> getPosition() async {
    await _enable();
    await _getPermission();

    return location.getLocation();
  }
}

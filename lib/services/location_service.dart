import 'package:geolocator/geolocator.dart';

const (double, double) point = (41.2995, 69.2401);

sealed class LocationService {
  Future<LocationPermission> hasPermission();

  // Future<bool> isRequestService();

  Future<bool> openAppSettings();

  Future<bool> openLocationSettings();

  Future<Position> currentPosition();

  Future<(double, double)> determinePosition();
}

class LocationServiceImpl implements LocationService {
  LocationServiceImpl();

  @override
  Future<LocationPermission> hasPermission() async {
    late LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        return permission;
      }
    }

    return permission;
  }

  // @override
  // Future<bool> isRequestService() async {
  //   if (!(await location.serviceEnabled())) {
  //     final locationEnabled = await location.requestService();
  //     return locationEnabled;
  //   }
  //   return true;
  // }

  @override
  Future<bool> openLocationSettings() async =>
      Geolocator.openLocationSettings();

  @override
  Future<bool> openAppSettings() async => Geolocator.openAppSettings();

  @override
  Future<(double, double)> determinePosition() async {
    final position = await Geolocator.getCurrentPosition();
    return (position.latitude, position.longitude);
  }

  @override
  Future<Position> currentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    return position;
  }
}

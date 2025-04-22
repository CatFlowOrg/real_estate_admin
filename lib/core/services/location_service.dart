import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  final GeolocatorPlatform _geolocator = GeolocatorPlatform.instance;

  Future<bool> hasPermission() async {
    final status = await _geolocator.checkPermission();
    return status == LocationPermission.always || status == LocationPermission.whileInUse;
  }

  Future<void> requestPermission() async {
    await _geolocator.requestPermission();
  }

  Future<Position> getCurrentLocation() async {
    return await _geolocator.getCurrentPosition(locationSettings: const LocationSettings());
  }
  Future<Placemark?> getFullPlacemark() async {
    final hasPerm = await hasPermission();
    if (!hasPerm) await requestPermission();

    final position = await getCurrentLocation();
    final placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);

    if (placemarks.isNotEmpty) {
      return placemarks.first;
    }

    return null;
  }


}

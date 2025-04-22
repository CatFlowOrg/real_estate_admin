import 'package:geocoding/geocoding.dart';
import 'package:real_estate_admin/features/location/domain/entites/location_result.dart';

class LocationService {
  Future<LocationResult?> getCurrentLocation() async {
    final placemarks = await placemarkFromCoordinates(44.7866, 20.4489); // zameni realnom lokacijom

    if (placemarks.isNotEmpty) {
      final p = placemarks.first;
      return LocationResult(
        street: p.street,
        city: p.locality,
        country: p.country,
      );
    }
    return null;
  }
}

import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/features/location/domain/entites/location_result.dart';
import 'package:real_estate_admin/features/location/data/services/location_services.dart';

@injectable
class GetLocationDataUseCase {
  final LocationService _locationService;

  GetLocationDataUseCase(this._locationService);

  Future<LocationResult?> call() async {
    return await _locationService.getCurrentLocation();
  }
}

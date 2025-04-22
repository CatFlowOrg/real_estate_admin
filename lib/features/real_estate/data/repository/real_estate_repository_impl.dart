import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/api_service/api_service.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/services/location_service.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_details_response.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';

@Injectable(as: RealEstateRepository)
class RealEstateRepositoryImpl implements RealEstateRepository {
  final AuthApiService api;
  final LocationService _locationService;

  RealEstateRepositoryImpl(this.api, this._locationService);

  @override
  Future<DataState<RealEstateResponse>> getRealEstates() async {
    try {
      final response = await api.getRealEstates();
      final statusCode = response.response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        return DataState.success(response.data);
      } else {
        return DataState.error(
            response.response.statusMessage ?? 'Unexpected error');
      }
    } on DioException catch (e) {
      return DataState.error(
          e.response?.statusMessage ?? e.message ?? 'Unknown error'
      );
    }
  }

  @override
  Future<DataState<RealEstateDetailsResponse>> getRealEstateDetails(int id) async {
    try {
      final response = await api.getRealEstateDetails(id,0);
      final statusCode = response.response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        return DataState.success(response.data);
      } else {
        return DataState.error(
            response.response.statusMessage ?? 'Unexpected error');
      }
    } on DioException catch (e) {
      return DataState.error(
          e.response?.statusMessage ?? e.message ?? 'Unknown error'
      );
    }
  }

  @override
  Future<DataState<Placemark>> getLocationData() async{
    if (!await _locationService.hasPermission()) {
    await _locationService.requestPermission();
    }
    return DataState.success(await _locationService.getFullPlacemark());
  }
}
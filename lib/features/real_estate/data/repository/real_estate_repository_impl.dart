import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/api_service/api_service.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_item.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';

@Injectable(as: RealEstateRepository)
class RealEstateRepositoryImpl implements RealEstateRepository {
  final AuthApiService api;

  RealEstateRepositoryImpl(this.api);

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
  Future<DataState<RealEstateItem>> getRealEstateDetails(int id) async {
    try {
      final response = await api.getRealEstateDetails(id);
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
}
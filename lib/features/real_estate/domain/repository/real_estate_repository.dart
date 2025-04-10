import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';

abstract class RealEstateRepository {
  Future<DataState<RealEstateResponse>> getRealEstates();
}

import 'package:geocoding/geocoding.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';

@Injectable()
class GetLocationDataUseCase
    implements UseCase<DataState<Placemark>, void> {
  final RealEstateRepository repository;

  GetLocationDataUseCase(this.repository);

  @override
  Future<DataState<Placemark>> call({params}) {
    return repository.getLocationData();
  }
}

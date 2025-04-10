import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_response.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';

@Injectable()
class GetRealEstatesUseCase implements UseCase<DataState<RealEstateResponse>, void> {
  final RealEstateRepository repository;

  GetRealEstatesUseCase(this.repository);

  @override
  Future<DataState<RealEstateResponse>> call({params}) {
    return repository.getRealEstates();
  }
}

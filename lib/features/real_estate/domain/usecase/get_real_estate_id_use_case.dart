import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/real_estate/data/models/real_estate_item.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';

@Injectable()
class GetRealEstateIdUseCase
    implements UseCase<DataState<RealEstateItem>, int> {
  final RealEstateRepository repository;

  GetRealEstateIdUseCase(this.repository);

  @override
  Future<DataState<RealEstateItem>> call({int? params}) {
    return repository.getRealEstateDetails(params!);
  }
}

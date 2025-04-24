import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/real_estate/data/models/hashtag.dart';
import 'package:real_estate_admin/features/real_estate/domain/repository/real_estate_repository.dart';
import 'package:real_estate_admin/features/real_estate/presentation/screens/create_real_estate/tabs/hashtag/presentation/screen/hashtag_tab.dart';

@Injectable()
class GetHashtagsUseCase implements UseCase<DataState<List<Hashtag>>, void> {
  final RealEstateRepository repository;

  GetHashtagsUseCase(this.repository);

  @override
  Future<DataState<List<Hashtag>>> call({void params}) {
    return repository.getHashtags(0);
  }
}

import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/auth/data/models/user_response.dart';
import 'package:real_estate_admin/features/auth/domain/repository/auth_repository.dart';

@Injectable()
class GetUserInfoUseCase
    implements UseCase<DataState<UserResponse>, void> {
  final AuthRepository repository;

  GetUserInfoUseCase(this.repository);

  @override
  Future<DataState<UserResponse>> call({params}) {
    return repository.getUser();
  }
}

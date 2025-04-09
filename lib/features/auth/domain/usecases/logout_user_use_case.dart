import 'package:injectable/injectable.dart';

import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';
import 'package:real_estate_admin/features/auth/domain/repository/auth_repository.dart';

@Injectable()
class LogoutUserUseCase implements UseCase<DataState, void> {
  final AuthRepository repository;

  LogoutUserUseCase(this.repository);

  @override
  Future<DataState> call({params}) {
    return repository.logout();
  }
}

import 'package:injectable/injectable.dart';

import '../../../../core/data_state/data_state.dart';
import '../../../../core/usecases/use_case.dart';
import '../repository/auth_repository.dart';

@Injectable()
class LogoutUserUseCase implements UseCase<DataState, void> {
  final AuthRepository repository;

  LogoutUserUseCase(this.repository);

  @override
  Future<DataState> call({params}) {
    return repository.logout();
  }
}

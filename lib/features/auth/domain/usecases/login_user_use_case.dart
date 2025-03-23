import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/core/usecases/use_case.dart';

import '../../data/models/login_user.dart';
import '../../data/models/login_user_response.dart';
import '../repository/auth_repository.dart';

@Injectable()
class LoginUserUseCase implements UseCase<DataState<LoginUserResponse>, LoginUserModel> {
  final AuthRepository repository;

  LoginUserUseCase(this.repository);

  @override
  Future<DataState<LoginUserResponse>> call({LoginUserModel? params}) {
    return repository.login(params!);
  }
}
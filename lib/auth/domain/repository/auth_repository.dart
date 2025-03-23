import '../../../core/data_state/data_state.dart';
import '../../data/models/login_user.dart';
import '../../data/models/login_user_response.dart';

abstract class AuthRepository {
  Future<DataState<LoginUserResponse>> login(LoginUserModel model);
}

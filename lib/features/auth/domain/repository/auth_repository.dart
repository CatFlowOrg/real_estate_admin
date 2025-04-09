import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user_response.dart';

abstract class AuthRepository {
  Future<DataState<LoginUserResponse>> login(LoginUserModel model);
  Future<DataState> logout();
}

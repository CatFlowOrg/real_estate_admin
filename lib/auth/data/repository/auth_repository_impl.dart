import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../core/api_service/api_service.dart';
import '../../../core/data_state/data_state.dart';
import '../../../core/helpers/api_helpers.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/login_user.dart';
import '../models/login_user_response.dart';
import '../services/auth_local_service.dart';
@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthApiService api;
  final AuthLocalService localService;

  AuthRepositoryImpl(this.api, this.localService);

  @override
  Future<DataState<LoginUserResponse>> login(LoginUserModel model) async {
    try {
      final response = await api.login(model);

      final statusCode = response.response.statusCode ?? 0;
      if (statusCode >= 200 && statusCode < 300) {
        await localService.saveTokens(
          authToken: response.data.authToken,
          refreshToken: response.data.refreshToken,
        );

        return DataState.success(response.data);
      } else {
        return DataState.error(
          response.response.statusMessage ?? 'Unexpected error',
        );
      }
    } on DioException catch (e) {
      return DataState.error(
        e.response?.statusMessage ?? e.message ?? 'Unknown error',
      );
    }
  }
}

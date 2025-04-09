import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import 'package:real_estate_admin/core/api_service/api_service.dart';
import 'package:real_estate_admin/core/data_state/data_state.dart';
import 'package:real_estate_admin/features/auth/domain/repository/auth_repository.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user.dart';
import 'package:real_estate_admin/features/auth/data/models/login_user_response.dart';
import 'package:real_estate_admin/features/auth/data/services/auth_local_service.dart';
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

  @override
  Future<DataState> logout()async {
    try{
      return DataState.success();
    }catch(e){
      return DataState.error(e.toString());
    }
  }
}

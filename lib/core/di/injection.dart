import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'package:real_estate_admin/core/di/injection.config.dart';
import 'package:real_estate_admin/features/auth/data/services/auth_local_service.dart';
import 'package:real_estate_admin/core/api_service/api_service.dart';
import 'package:real_estate_admin/core/utils/auth_notifier.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  @lazySingleton
  Dio dio(AuthNotifier authNotifier) {
    final dio = Dio();

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = authNotifier.token;
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
      ),
    );

    return dio;
  }

  @lazySingleton
  AuthApiService authApiService(Dio dio) {
    return AuthApiService(dio, baseUrl: 'https://qa.palace.agency/api/');
  }

  @lazySingleton
  AuthLocalService authLocalService() => AuthLocalService();

  @lazySingleton
  AuthNotifier get authNotifier => AuthNotifier();
}

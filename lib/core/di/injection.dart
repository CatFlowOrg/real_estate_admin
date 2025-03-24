import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/core/di/injection.config.dart';

import '../../features/auth/data/services/auth_local_service.dart';
import '../api_service/api_service.dart';
import '../utils/auth_notifier.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true
)
void configureDependencies() => getIt.init();

@module
abstract class AppModule {
  @lazySingleton
  Dio dio() => Dio();

  @lazySingleton
  AuthApiService authApiService(Dio dio) {
    return AuthApiService(dio, baseUrl: 'https://qa.palace.agency/api/');
  }

  @lazySingleton
  AuthLocalService authLocalService() => AuthLocalService();

  @lazySingleton
  AuthNotifier get authNotifier => AuthNotifier();

}
// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/data/services/auth_local_service.dart' as _i790;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/login_user_use_case.dart' as _i2;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../api_service/api_service.dart' as _i317;
import 'injection.dart' as _i464;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.lazySingleton<_i361.Dio>(() => appModule.dio());
    gh.lazySingleton<_i790.AuthLocalService>(
        () => appModule.authLocalService());
    gh.lazySingleton<_i317.AuthApiService>(
        () => appModule.authApiService(gh<_i361.Dio>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i317.AuthApiService>(),
          gh<_i790.AuthLocalService>(),
        ));
    gh.factory<_i2.LoginUserUseCase>(
        () => _i2.LoginUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i797.AuthBloc>(
        () => _i797.AuthBloc(gh<_i2.LoginUserUseCase>()));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}

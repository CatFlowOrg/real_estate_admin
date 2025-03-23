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

import '../../auth/data/repository/auth_repository_impl.dart' as _i727;
import '../../auth/data/services/auth_local_service.dart' as _i315;
import '../../auth/domain/repository/auth_repository.dart' as _i616;
import '../../auth/domain/usecases/login_user_use_case.dart' as _i535;
import '../../auth/presentation/bloc/auth_bloc.dart' as _i946;
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
    gh.lazySingleton<_i315.AuthLocalService>(
        () => appModule.authLocalService());
    gh.lazySingleton<_i317.AuthApiService>(
        () => appModule.authApiService(gh<_i361.Dio>()));
    gh.factory<_i616.AuthRepository>(() => _i727.AuthRepositoryImpl(
          gh<_i317.AuthApiService>(),
          gh<_i315.AuthLocalService>(),
        ));
    gh.factory<_i535.LoginUserUseCase>(
        () => _i535.LoginUserUseCase(gh<_i616.AuthRepository>()));
    gh.factory<_i946.AuthBloc>(
        () => _i946.AuthBloc(gh<_i535.LoginUserUseCase>()));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}

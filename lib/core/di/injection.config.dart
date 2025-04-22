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

import '../../features/admin_panel/data/repository/agent_repository_impl.dart'
    as _i463;
import '../../features/admin_panel/domain/repository/agent_repository.dart'
    as _i901;
import '../../features/admin_panel/domain/usecase/get_agent_use_case.dart'
    as _i281;
import '../../features/admin_panel/presentation/bloc/agent_bloc/agent_bloc.dart'
    as _i989;
import '../../features/auth/data/repository/auth_repository_impl.dart' as _i409;
import '../../features/auth/data/services/auth_local_service.dart' as _i790;
import '../../features/auth/domain/repository/auth_repository.dart' as _i961;
import '../../features/auth/domain/usecases/get_user_info_use_case.dart'
    as _i923;
import '../../features/auth/domain/usecases/login_user_use_case.dart' as _i2;
import '../../features/auth/domain/usecases/logout_user_use_case.dart' as _i506;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/real_estate/data/repository/real_estate_repository_impl.dart'
    as _i331;
import '../../features/real_estate/domain/repository/real_estate_repository.dart'
    as _i534;
import '../../features/real_estate/domain/usecase/get_real_estate_id_use_case.dart'
    as _i154;
import '../../features/real_estate/domain/usecase/get_real_estates_use_case.dart'
    as _i476;
import '../../features/real_estate/presentation/bloc/real_estate_bloc.dart'
    as _i815;
import '../../features/real_estate/presentation/screens/create_real_estate/bloc/create_real_estate_bloc.dart'
    as _i883;
import '../api_service/api_service.dart' as _i317;
import '../utils/auth_interceptor.dart' as _i741;
import '../utils/auth_notifier.dart' as _i840;
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
    gh.factory<_i883.CreateRealEstateBloc>(() => _i883.CreateRealEstateBloc());
    gh.lazySingleton<_i840.AuthNotifier>(() => appModule.authNotifier);
    gh.lazySingleton<_i790.AuthLocalService>(
        () => appModule.authLocalService());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio(gh<_i840.AuthNotifier>()));
    gh.lazySingleton<_i317.AuthApiService>(
        () => appModule.authApiService(gh<_i361.Dio>()));
    gh.factory<_i534.RealEstateRepository>(
        () => _i331.RealEstateRepositoryImpl(gh<_i317.AuthApiService>()));
    gh.factory<_i961.AuthRepository>(() => _i409.AuthRepositoryImpl(
          gh<_i317.AuthApiService>(),
          gh<_i790.AuthLocalService>(),
        ));
    gh.lazySingleton<_i741.AuthInterceptor>(() => _i741.AuthInterceptor(
          gh<_i840.AuthNotifier>(),
          gh<_i317.AuthApiService>(),
        ));
    gh.factory<_i476.GetRealEstatesUseCase>(
        () => _i476.GetRealEstatesUseCase(gh<_i534.RealEstateRepository>()));
    gh.factory<_i154.GetRealEstateIdUseCase>(
        () => _i154.GetRealEstateIdUseCase(gh<_i534.RealEstateRepository>()));
    gh.factory<_i815.RealEstateBloc>(() => _i815.RealEstateBloc(
          gh<_i476.GetRealEstatesUseCase>(),
          gh<_i154.GetRealEstateIdUseCase>(),
        ));
    gh.factory<_i923.GetUserInfoUseCase>(
        () => _i923.GetUserInfoUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i2.LoginUserUseCase>(
        () => _i2.LoginUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i506.LogoutUserUseCase>(
        () => _i506.LogoutUserUseCase(gh<_i961.AuthRepository>()));
    gh.factory<_i901.AgentRepository>(
        () => _i463.AgentRepositoryImpl(gh<_i317.AuthApiService>()));
    gh.factory<_i281.GetAgentsUseCase>(
        () => _i281.GetAgentsUseCase(gh<_i901.AgentRepository>()));
    gh.factory<_i797.AuthBloc>(() => _i797.AuthBloc(
          gh<_i2.LoginUserUseCase>(),
          gh<_i506.LogoutUserUseCase>(),
          gh<_i923.GetUserInfoUseCase>(),
        ));
    gh.factory<_i989.AgentBloc>(
        () => _i989.AgentBloc(gh<_i281.GetAgentsUseCase>()));
    return this;
  }
}

class _$AppModule extends _i464.AppModule {}

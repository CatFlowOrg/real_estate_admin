import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:real_estate_admin/features/auth/data/models/user_response.dart';
import 'package:real_estate_admin/features/auth/domain/usecases/get_user_info_use_case.dart';
import 'package:real_estate_admin/features/auth/domain/usecases/logout_user_use_case.dart';

import 'package:real_estate_admin/features/auth/data/models/login_user.dart';
import 'package:real_estate_admin/features/auth/domain/usecases/login_user_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;
  final LogoutUserUseCase _logoutUserUseCase;
  final GetUserInfoUseCase _getUserInfoUseCase;

  AuthBloc(this._loginUserUseCase, this._logoutUserUseCase,this._getUserInfoUseCase)
      : super(const AuthStateInitial()) {
    on<LoginUser>(_onLoginUser);
    on<LogoutUser>(_onLogoutUser);
    on<GetUserInfo>(_getUserInfo);
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(LoginStateLoading());

    final dataState = await _loginUserUseCase(params: event.model);

    if (dataState.isSuccess && dataState.data != null) {
      emit(LoginStateSuccess(
        authToken: dataState.data!.authToken,
        refreshToken: dataState.data!.refreshToken,
      ));
    } else {
      emit(LoginStateError());
    }
  }

  Future<void> _onLogoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    final dataState = await _logoutUserUseCase();
    if (dataState.isSuccess) {
      emit(LogoutStateSuccess());
    } else {
      emit(LogoutStateError());
    }
  }

  Future<void> _getUserInfo(GetUserInfo event, Emitter<AuthState> emit) async {
    emit(LoginStateLoading());

    final dataState = await _getUserInfoUseCase();

    if (dataState.isSuccess && dataState.data != null) {
      emit(GetUserInfoSuccess(userResponse: dataState.data!));
    } else {
      emit(LoginStateError());
    }
  }
}

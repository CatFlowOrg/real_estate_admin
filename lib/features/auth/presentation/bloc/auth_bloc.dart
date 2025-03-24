import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc/bloc.dart';
import 'package:real_estate_admin/features/auth/domain/usecases/logout_user_use_case.dart';

import '../../data/models/login_user.dart';
import '../../domain/usecases/login_user_use_case.dart';


part 'auth_event.dart';

part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;
  final LogoutUserUseCase _logoutUserUseCase;

  AuthBloc(this._loginUserUseCase, this._logoutUserUseCase) : super(const AuthStateInitial()) {
    on<LoginUser>(_onLoginUser);
    on<LogoutUser>(_onLogoutUser);
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
    if(dataState.isSuccess){
      emit(LogoutStateSuccess());
    }else{
      emit(LogoutStateError());
    }
  }

}

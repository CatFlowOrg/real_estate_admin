import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:real_estate_admin/auth/domain/usecases/login_user_use_case.dart';
import 'package:bloc/bloc.dart';

import '../../data/models/login_user.dart';


part 'auth_event.dart';

part 'auth_state.dart';

@Injectable()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUserUseCase _loginUserUseCase;

  AuthBloc(this._loginUserUseCase) : super(const AuthStateInitial()) {
    on<LoginUser>(_onLoginUser);
  }

  Future<void> _onLoginUser(LoginUser event, Emitter<AuthState> emit) async {
    emit(AuthStateLoading());

    final dataState = await _loginUserUseCase(params: event.model);

    if (dataState.isSuccess && dataState.data != null) {
      emit(AuthStateSuccess(
        authToken: dataState.data!.authToken,
        refreshToken: dataState.data!.refreshToken,
      ));
    } else {
      emit(AuthStateError());
    }
  }

}

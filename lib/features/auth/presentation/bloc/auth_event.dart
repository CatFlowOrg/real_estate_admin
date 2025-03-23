part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class LoginUser extends AuthEvent {
  final LoginUserModel model;

  const LoginUser(this.model);

  @override
  List<Object?> get props => [model];
}

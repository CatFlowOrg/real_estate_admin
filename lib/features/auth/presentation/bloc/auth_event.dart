part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

//Login user
class LoginUser extends AuthEvent {
  final LoginUserModel model;

  const LoginUser(this.model);

  @override
  List<Object?> get props => [model];
}

//Logout User
class LogoutUser extends AuthEvent {
  const LogoutUser();
}

//Get User Info
class GetUserInfo extends AuthEvent{
  const GetUserInfo();
  @override
  List<Object?> get props => [];
}

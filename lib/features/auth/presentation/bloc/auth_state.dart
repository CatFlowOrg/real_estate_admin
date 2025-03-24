part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class LoginStateLoading extends AuthState {}

class LoginStateSuccess extends AuthState {
  final String authToken;
  final String refreshToken;

  const LoginStateSuccess({
    required this.authToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [authToken, refreshToken];
}

class LoginStateError extends AuthState {}

class LogoutStateSuccess extends AuthState  {}

class LogoutStateError extends AuthState {}

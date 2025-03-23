part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class AuthStateLoading extends AuthState {}

class AuthStateSuccess extends AuthState {
  final String authToken;
  final String refreshToken;

  const AuthStateSuccess({
    required this.authToken,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [authToken, refreshToken];
}

class AuthStateError extends AuthState {}

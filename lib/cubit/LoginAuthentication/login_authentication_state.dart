part of 'login_authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationLoginInitial extends AuthenticationState {}

final class AuthenticationLoginLoading extends AuthenticationState {}

final class AuthenticationLoginSuccess extends AuthenticationState {
  final UserCredential user;

  AuthenticationLoginSuccess({required this.user});
}

final class AuthenticationLoginFailure extends AuthenticationState {
  final String message;

  AuthenticationLoginFailure({required this.message});
}

part of 'login_authentication_cubit.dart';

sealed class AuthenticationState {}

final class AuthenticationLoginInitial extends AuthenticationState {}

final class AuthenticationLoginLoading extends AuthenticationState {}

final class AuthenticationLoginSuccess extends AuthenticationState {}

final class AuthenticationLoginFailure extends AuthenticationState {
  final String message;

  AuthenticationLoginFailure({required this.message});
}

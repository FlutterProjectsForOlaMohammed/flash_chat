part of 'register_authentication_cubit.dart';

@immutable
sealed class RegisterAuthenticationState {}

final class AuthenticationRegisterInitial extends RegisterAuthenticationState {}

final class AuthenticationRegisterLoading extends RegisterAuthenticationState {}

final class AuthenticationRegisterSuccess extends RegisterAuthenticationState {}

final class AuthenticationRegisterFailure extends RegisterAuthenticationState {
  final String message;

  AuthenticationRegisterFailure({required this.message});
}

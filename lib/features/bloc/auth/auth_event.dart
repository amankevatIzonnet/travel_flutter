part of 'auth_bloc.dart';

sealed class AuthEvent {}

class LoginRequestEvent extends AuthEvent {
  final String email;
  final String password;

  LoginRequestEvent({required this.email, required this.password});
}

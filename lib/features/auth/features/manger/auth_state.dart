part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ShowPassVisibility extends AuthState {}
class RegisterLoading extends AuthState {}
class RegisterSuccess extends AuthState {
 final String uid;
 RegisterSuccess(this.uid);
}
class RegisterError extends AuthState {
  final String error;
  RegisterError(this.error);
}
class LoginLoading extends AuthState {}
class LoginSuccess extends AuthState {
  final String uid;
  LoginSuccess(this.uid);
}
class LoginError extends AuthState {
  final String error;
  LoginError(this.error);
}


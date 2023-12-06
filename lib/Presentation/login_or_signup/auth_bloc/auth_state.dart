part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthactionState extends AuthState{}

class Loadingstate extends AuthactionState{}

class SignupLoadingstate extends AuthactionState{}

class AuthInitial extends AuthState{}

class EmptyFieldState extends AuthState{}

class SignupSuccess extends AuthState {}

class SigninSuccess extends AuthState{}

class Autherror extends AuthState{}

class SignupAutherror extends AuthState{}

class Signoutstate extends AuthState{}

class PassresetloadingState extends AuthState{}

class Passwordsuccesssstate extends AuthState{
}

class PasswordexceptionState extends AuthState{
  final String error;
  PasswordexceptionState({
    required this.error
  });
}


part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

abstract class AuthactionState extends AuthState{}

class Loadingstate extends AuthactionState{}

class AuthInitial extends AuthState{}

class EmptyFieldState extends AuthState{}

class SignupsSuccess extends AuthState {}

class SigninSuccess extends AuthState{}

class Autherror extends AuthState{}

class Signoutstate extends AuthState{}


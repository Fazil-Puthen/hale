part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Signupevent extends AuthEvent{
 
  final String email;
  final String password;
 
  Signupevent({
  required this.email,
  required this.password,
  });
}

class SignInevent extends AuthEvent{
  final String email;
  final String password;
  
  SignInevent({
  required this.email,
  required this.password});
}

class Signoutevent extends AuthEvent{}

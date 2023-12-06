part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class Signupevent extends AuthEvent{
  final String name;
  final String phone;
  final String email;
  final String password;
 
  Signupevent({
    required this.name,
    required this.phone,
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

class Passwordresetevent extends AuthEvent{
final String email;
Passwordresetevent({required this.email});
}


class Signoutevent extends AuthEvent{}

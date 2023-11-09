import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hale/Presentation/login_or_signup/auth_repos/auth_repository.dart';
import 'package:meta/meta.dart';
part 'auth_event.dart';
part 'auth_state.dart';

final authrepo=AuthReopsitoy();


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
   on<Signupevent>(signupeventhandler);
   on<SignInevent>(signineventhandler);
   on<Signoutevent>(signouteventhandler);
  }
  
  //signupevent
  FutureOr<void> signupeventhandler(Signupevent event, Emitter<AuthState> emit)async {
    emit(Loadingstate());
    try{
      if(event.email.isEmpty||event.password.isEmpty){
        emit(EmptyFieldState());
      }else{
      final success=await authrepo.signup(
      email: event.email,
       password: event.password,
       name: event.name,
       phone: event.phone);
      print('tried');
      if(success){
        emit(SignupsSuccess());
      }
      else{
        emit(Autherror());
      }}
    }   
    catch(e){
      print('the excption was $e');
      emit(Autherror());
    }
  }

  FutureOr<void> signineventhandler(SignInevent event, Emitter<AuthState> emit)async {
    try{
      if(event.email.isEmpty||event.password.isEmpty){
        emit(EmptyFieldState());
      }else{
      emit(Loadingstate());
      final success=await authrepo.signin(email: event.email, password: event.password);
      print('tried');
      if(success){
        emit(SigninSuccess());
      }
      else{
        emit(Autherror());
      }
      }
    }
    catch(e){
      print('the excption was $e');
      emit(Autherror());
    }
  }


  FutureOr<void> signouteventhandler(Signoutevent event, Emitter<AuthState> emit)async {
   final result=await authrepo.signout();
   emit(Signoutstate());
  }
}

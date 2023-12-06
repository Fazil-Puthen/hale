import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
   on<Passwordresetevent>(passwordresethandler);
  }
  
  //signupevent
  FutureOr<void> signupeventhandler(Signupevent event, Emitter<AuthState> emit)async {
    emit(SignupLoadingstate());
    try{
      if(event.email.isEmpty||event.password.isEmpty){
        emit(EmptyFieldState());
      }else{
      final success=await authrepo.signup(
      email: event.email,
       password: event.password,
       name: event.name,
       phone: event.phone);
      if(success){
        emit(SignupSuccess());
      }
      else{
        emit(SignupAutherror());
      }}
    }   
    catch(e){
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
      if(success){
        emit(SigninSuccess());
      }
      else{
        emit(Autherror());
      }
      }
    }
    catch(e){
      emit(Autherror());
    }
  }


  FutureOr<void> signouteventhandler(Signoutevent event, Emitter<AuthState> emit)async {
   await authrepo.signout();
   emit(Signoutstate());
  }

  FutureOr<void> passwordresethandler(Passwordresetevent event, Emitter<AuthState> emit) async{
    emit(PasswordexceptionState(error: 'validating....'));
    try{
    await FirebaseAuth.instance.sendPasswordResetEmail(email: event.email);
    emit(Passwordsuccesssstate());
    }
    on FirebaseAuthException catch(error){
      emit(PasswordexceptionState(error: error.message.toString()));
    }
  }
}

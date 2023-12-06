import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<HomeInitevent>(homeinithandler);
    on<Navigationwidgetchangeevent>(navigationhandler);
    on<FetchNameEvent>(fetchnamehandler);
   
    // on<Wishfetchevent>(wishfetchhandler);
  }
     final firestore=FirebaseFirestore.instance;
    
  FutureOr<void> homeinithandler(HomeInitevent event, Emitter<HomeState> emit) {
    
  }

  FutureOr<void> navigationhandler(Navigationwidgetchangeevent event, Emitter<HomeState> emit)async {
    emit(Navigationchangestate(index:event.index));
  }
   
 

  
  FutureOr<void> fetchnamehandler(FetchNameEvent event, Emitter<HomeState> emit) async{
    final userdata=await FirebaseFirestore.instance.collection('users').doc(userid).get();
    if(userdata.exists){
    final value=userdata.data();
    username=value?['Name'];}
    else{
      username='No name';
    }
  }
  }

 


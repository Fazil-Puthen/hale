import 'dart:async';
// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
  }

  FutureOr<void> homeinithandler(HomeInitevent event, Emitter<HomeState> emit) {
    
  }

  FutureOr<void> navigationhandler(Navigationwidgetchangeevent event, Emitter<HomeState> emit)async {
    emit(Navigationchangestate(index:event.index));
 
  }
}

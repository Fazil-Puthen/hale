import 'dart:async';
// import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
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
    // on<Wishfetchevent>(wishfetchhandler);
  }

  FutureOr<void> homeinithandler(HomeInitevent event, Emitter<HomeState> emit) {
    
  }

  FutureOr<void> navigationhandler(Navigationwidgetchangeevent event, Emitter<HomeState> emit)async {
    print('index: ${event.index}');  
    emit(Navigationchangestate(index:event.index));
  }

  }


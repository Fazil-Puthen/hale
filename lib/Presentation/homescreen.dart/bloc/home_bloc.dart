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
    final result=await FirebaseFirestore.instance.collection('products').get();
    List<String> docid=result.docs.map((DocumentSnapshot doc) =>doc.id ).toList();
    print(docid);
    final one=docid[0];
    // if(result.docs[4]['category']==event.category){
    //   debugPrint('this is the category ${result.docs[4]}');
    // }
    // print('the result from document ${result}');
  }
}

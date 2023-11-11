import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Cartfetchevent>(cartfetchhandler);
  }

  FutureOr<void> cartfetchhandler(Cartfetchevent event, Emitter<CartState> emit) {
    final firestore=FirebaseFirestore.instance;
    final usercollection=firestore.collection('users').doc(event.userid).collection('cart').doc().get();
    print('user collection $usercollection');
    
  }
}

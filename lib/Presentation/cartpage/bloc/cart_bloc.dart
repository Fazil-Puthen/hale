import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Cartfetchevent>(cartfetchhandler);
    // on<Quantityaddordelete>(quantityhandler);
  }

  List<Productmodel> cartlist=[];
  int totalprice=0;

  FutureOr<void> cartfetchhandler(Cartfetchevent event, Emitter<CartState> emit) async{
    emit(Cartloadingstate());
    // await Future.delayed(Duration(seconds: 5));
    cartlist.clear();
    totalprice=0;
    final firestore=FirebaseFirestore.instance;
    final usercollection=await firestore.collection('users').doc(event.userid).collection('cart').get();
    if(usercollection.docs.isNotEmpty){
    for(var document in usercollection.docs){
     var data=document.data();
     
     final cartproduct=Productmodel(
     brand:data['brand'] , 
     name: data['name'],
     category: data['category'],
     description: data['description'],
     price: data['price'], 
     quantitiy: data['quantity'],
     imageurl: data['imageurl'],
     cartquantity:data['cartquantity'],
     quantitypricechange: data['quantityprice']);

    totalprice=totalprice+data['quantityprice'] as int;
     
     cartlist.add(cartproduct);
    }
    emit(CartsuccesState(cartproduct: cartlist,total: totalprice));
    }
    else{
    emit(CartEmptystate());
    print(totalprice);}
    
    
  }

  // FutureOr<void> quantityhandler(Quantityaddordelete event, Emitter<CartState> emit) {
  //   // final firestore=firebas
  //   emit(Quantityaddedestate(addedquantity:event.quantitiy++ ));
  // }
}

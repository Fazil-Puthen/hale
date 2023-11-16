import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:meta/meta.dart';

part 'detailpage_event.dart';
part 'detailpage_state.dart';



class DetailpageBloc extends Bloc<DetailpageEvent, DetailpageState> {
  DetailpageBloc() : super(DetailpageInitial()) {
    on<DetailpageEvent>((event, emit) {
      // TODO: implement event handler
    }
    );
     on<DetailedviewEvent>(detailedviewhandler);
    //  on<Buttonclickedevent>(buttonclickedhandler);
     on<Addtocartevent>(addtocarthandler);
  }
  //  bool clicked=false;
    bool cartclicked = false;
    bool wishclicked = false;
   final firestore=FirebaseFirestore.instance;


  FutureOr<void> detailedviewhandler(DetailedviewEvent event, Emitter<DetailpageState> emit) async{
    final firestore=FirebaseFirestore.instance;
    final documnetsnapshot=await firestore.collection('products').doc(event.docid).get();
    emit(Detailedstate(productsnapshot: documnetsnapshot));
  }

  // FutureOr<void> buttonclickedhandler(Buttonclickedevent event, Emitter<DetailpageState> emit) {
  //   emit(Buttonclickedstate(clicked: clicked));
  // }

  FutureOr<void> addtocarthandler(Addtocartevent event, Emitter<DetailpageState> emit)async {
    // clicked=!clicked;
    // emit(Buttonclickedstate(clicked: clicked));
    // bool cartclicked = false;
    // bool wishclicked = false;
    final data=event.productdata;
    final maincollection=firestore.collection('users');
    final usercart=maincollection.doc(event.userid).collection('cart').doc(data.name);
    final userwishlist= maincollection.doc(event.userid).collection('wishlist').doc(data.name);

    if(event.addto==Addto.initialcheck){
     await Future.wait([
      usercart.snapshots().first.then((DocumentSnapshot snapshot) {
        cartclicked = snapshot.exists;
        print('inside snapshot cart $cartclicked');
      }),
      userwishlist.snapshots().first.then((DocumentSnapshot snapshot) {
        wishclicked = snapshot.exists;
        print('inside snapshot wish $wishclicked');
      }),
    ]);

    print('this is cartcliked in bloc $cartclicked');
    print('this is wishcliked in bloc $wishclicked');
    }
    
  
   if(event.addto==Addto.cart){
    print('this is inside addtocart $cartclicked');
    cartclicked=!cartclicked;
    print('this is outside addtocart $cartclicked');
    if(cartclicked==true){
      await usercart.set(
      {
         'name':data.name,
         'brand':data.brand,
         'category':data.category,
         'description':data.description,
         'imageurl':data.imageurl,
         'price':data.price,
         'quantityprice':data.price,
         'quantity':data.quantitiy,
         'cartquantity':1,

      }
    );}
    else if(cartclicked==false){
         await usercart.delete();
    }
   }
  
   else if(event.addto==Addto.wishlist){
    wishclicked=!wishclicked;
    if(wishclicked==true){
    await userwishlist.set({
       'name':data.name,
         'brand':data.brand,
         'category':data.category,
         'description':data.description,
         'imageurl':data.imageurl,
         'price':data.price,
         'quantity':data.quantitiy,
         'cartquantity':1,
    });}
    else
    {
      await userwishlist.delete();
    }
   }
   emit(Buttonclickedstate(cartclicked: cartclicked, wishclicked: wishclicked));
  }

}

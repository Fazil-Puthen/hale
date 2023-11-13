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
     on<Buttonclickedevent>(buttonclickedhandler);
     on<Addtocartevent>(addtocarthandler);
  }
   bool clicked=false;


  FutureOr<void> detailedviewhandler(DetailedviewEvent event, Emitter<DetailpageState> emit) async{
    final firestore=FirebaseFirestore.instance;
    final documnetsnapshot=await firestore.collection('products').doc(event.docid).get();
    emit(Detailedstate(productsnapshot: documnetsnapshot));
  }

  FutureOr<void> buttonclickedhandler(Buttonclickedevent event, Emitter<DetailpageState> emit) {
    clicked=!clicked;
    emit(Buttonclickedstate(clicked: clicked));
  }

  FutureOr<void> addtocarthandler(Addtocartevent event, Emitter<DetailpageState> emit) {
    final firestore=FirebaseFirestore.instance;
    final data=event.productdata;
    final maincollection=firestore.collection('users');
   if(event.addto==Addto.cart){
      final usercart=maincollection.doc(event.userid).collection('cart').doc(event.productdata.name).set(
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
    );
   }
   else if(event.addto==Addto.wishlist){
    maincollection.doc(event.userid).collection('wishlist').doc(event.productdata.name).set({
       'name':data.name,
         'brand':data.brand,
         'category':data.category,
         'description':data.description,
         'imageurl':data.imageurl,
         'price':data.price,
         'quantity':data.quantitiy,
         'cartquantity':1,
    });
   }

  }

}

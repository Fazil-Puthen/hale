import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'adress_event.dart';
part 'adress_state.dart';

class AdressBloc extends Bloc<AdressEvent, AdressState> {
  AdressBloc() : super(AdressInitial()) {
    on<AdressEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AdressaddEvent>(adressaddhandler);
    on<AdressdeleteEvent>(adressdeltehandler);
    on<AdressfetchEvent>(adressfetchhandler);
  }
  List<Adressmodel> adresslist=[];
  final firestore=FirebaseFirestore.instance;

  FutureOr<void> adressaddhandler(AdressaddEvent event, Emitter<AdressState> emit) {
    final adress=firestore.collection('users').doc(userid).collection('adress').doc(event.place);

    if(event.adresscontrol==Addordelete.add){
    adress.set({
      'housename':event.housename,
      'place':event.place,
      'pincode':event.pincode

    });
    final newadress=Adressmodel(
      housename: event.housename,
      place: event.place,
      pincode: event.pincode);
    
     adresslist.add(newadress);}


    else if(event.adresscontrol==Addordelete.update&&event.index!=null){
      adress.update({
      'housename':event.housename,
      'place':event.place,
      'pincode':event.pincode
      });
      adresslist[event.index!]=Adressmodel(
        housename: event.housename, 
        place: event.place, 
        pincode: event.pincode);
    }
     
     emit(AdressamangeState(adresslist: adresslist));

  }

  FutureOr<void> adressdeltehandler(AdressdeleteEvent event, Emitter<AdressState> emit) {
    final adress=firestore.collection('users').doc(userid).collection('adress').doc(adresslist[event.index].place);
    adress.delete();
    adresslist.removeAt(event.index);

      if(adresslist.isNotEmpty){
    emit(AdressamangeState(adresslist: adresslist));}
    else {
      emit(Adressemptystate());
    }
  }

  FutureOr<void> adressfetchhandler(AdressfetchEvent event, Emitter<AdressState> emit) async{
    emit(Adressloadingstate());
    adresslist.clear();
    final adresses=await
     firestore.collection('users').doc(userid).collection('adress').get();
    for(var doc in adresses.docs){
      final value=doc.data();
      final newlist=Adressmodel(housename: value['housename'],
       place: value['place'], 
       pincode: value['pincode']);

       adresslist.add(newlist);
    }
    if(adresslist.isNotEmpty){
    emit(AdressamangeState(adresslist: adresslist));}
    else {
      emit(Adressemptystate());
    }
  }
}

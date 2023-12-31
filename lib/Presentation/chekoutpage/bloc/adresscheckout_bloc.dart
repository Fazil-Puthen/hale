import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'adresscheckout_event.dart';
part 'adresscheckout_state.dart';

class AdresscheckoutBloc extends Bloc<AdresscheckoutEvent, AdresscheckoutState> {
  AdresscheckoutBloc() : super(AdresscheckoutInitial()) {
    on<AdresscheckoutEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AdressinitEvent>(adressinithandler);
  }
  
  List<Adressmodel> adresslist=[];

  FutureOr<void> adressinithandler(AdressinitEvent event, Emitter<AdresscheckoutState> emit) async{
    emit(AdressloadingState());
    final fireestore=FirebaseFirestore.instance.collection('users').doc(userid);
    adresslist.clear();
    final adressSnapshot=await fireestore.collection('adress').get();
    for(var adress in adressSnapshot.docs){
      final data=adress.data();

      final adresses=Adressmodel(
        housename: data['housename'], 
        place: data['place'],
         pincode: data['pincode']);
    

       adresslist.add(adresses);  
    }
    emit(AdressInitstate(
      adressindex: event.adressindex,
      adreslist: adresslist));
  }
}

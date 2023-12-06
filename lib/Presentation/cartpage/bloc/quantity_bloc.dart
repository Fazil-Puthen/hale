import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'quantity_event.dart';
part 'quantity_state.dart';

class QuantityBloc extends Bloc<QuantityEvent, QuantityState> {
  QuantityBloc() : super(QuantityInitial()) {
    on<QuantityEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Quantityaddordelete>(qunatityhandler);
  }


  FutureOr<void> qunatityhandler(Quantityaddordelete event, Emitter<QuantityState> emit) async{
    int change=0;
    int qapricechange=0;
    final firestore=FirebaseFirestore.instance;
    final quantiychange=firestore.collection('users').doc(userid).collection('cart').doc(event.productid);
    
    if(event.quantitycontrol==Addordelete.add){
      change=event.quantitiy+1;
      qapricechange=(event.cartlist[event.index].quantitypricechange!+event.cartlist[event.index].price);
    }
    else if(event.quantitycontrol==Addordelete.delete){
      if(event.quantitiy>1){
      change=event.quantitiy-1;
      qapricechange=(event.cartlist[event.index].quantitypricechange!-event.cartlist[event.index].price);}
      else{
      await quantiychange.delete();
      event.cartlist.removeAt(event.index);
      }
    }
    
    event.cartlist[event.index].cartquantity=change;
    event.cartlist[event.index].quantitypricechange=qapricechange;
    await quantiychange.update({
      'cartquantity':change,
      'quantityprice':qapricechange,
    });
    emit(Quantityaddedestate(cartlist: event.cartlist));
  }
}

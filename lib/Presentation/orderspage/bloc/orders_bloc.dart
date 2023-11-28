import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/ordermodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersInitial()) {
    on<OrdersEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<OrdersFetchevent>(orderfetchhandler);
  }
  final firestore=FirebaseFirestore.instance;
  List<Ordermodel> orderlist=[];

  FutureOr<void> orderfetchhandler(OrdersFetchevent event, Emitter<OrdersState> emit)async {
    emit(Orderloadingstate());
    orderlist.clear();
   final orderdocs=await firestore.collection('users').doc(userid).collection('orders').get();
   if(orderdocs.docs.isNotEmpty){
   for(var document in orderdocs.docs){
    final data=document.data();
    
    final orderitem=Ordermodel(
    orderid: data['orderid'],
    paymentid: data['paymentid'],
    date: data['date'],
    items: data['items'],
    totalamount: data['totalprice']);

   orderlist.add(orderitem);
   }
   emit(Orderfetchedstate(orderlist: orderlist));
   }
   else{
    emit(OrdereEmptystate());
   }

  }
}

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:meta/meta.dart';

part 'shoppage_event.dart';
part 'shoppage_state.dart';

class ShoppageBloc extends Bloc<ShoppageEvent, ShoppageState> {
  ShoppageBloc() : super(ShoppageInitial()) {
    on<ShoppageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Homecategoryselectedevent>(categoryelectedhandler);
  }

    final List<Productmodel> products=[];

    Future<void> categoryelectedhandler(Homecategoryselectedevent event, Emitter<ShoppageState> emit)async {
      emit(Categoryloadingstate());
    products.clear();
    final result=await FirebaseFirestore.instance.collection('products').get();
    List<String> docid=result.docs.map((DocumentSnapshot doc) =>doc.id ).toList();
    
    for(var id in docid){
      final document=result.docs.firstWhere((doc) => doc.id==id);
      if(event.selection==Seperate.item){
      if(document['category']==event.category){
        final filteredproduct=Productmodel(
          brand: document['Brand'], 
          name: document['Name'],
          category: document['category'],
          description: document['description'],
          price: document['price'], 
          quantitiy: document['quantity'],
          imageurl: document['imageurl'],);
          //  print('this is the success state ${products.length}');
          
          products.add(filteredproduct);
      }}
      else if(event.selection==Seperate.price){
      if(document['price']<event.price){
        final filteredproduct=Productmodel(
          brand: document['Brand'], 
          name: document['Name'],
          category: document['category'],
          description: document['description'],
          price: document['price'], 
          quantitiy: document['quantity'],
          imageurl: document['imageurl'],);
          //  print('this is the success state ${products.length}');
          
          products.add(filteredproduct);
      }}
    }
    if(products.isNotEmpty){
    emit(CategorylistsuccessState(categorylist: products));
    }
    else{
      emit(CategorylistfailedState());
    }
    // print('this is the failed state ${products}');
  }
}

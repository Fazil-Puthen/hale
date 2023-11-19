import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'homewidgetcontrol_event.dart';
part 'homewidgetcontrol_state.dart';

class HomewidgetcontrolBloc extends Bloc<HomewidgetcontrolEvent, HomewidgetcontrolState> {
  HomewidgetcontrolBloc() : super(HomewidgetcontrolInitial()) {
    on<HomewidgetcontrolEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<Wishfetchevent>(wishfetchhandler);
    on<WishdeleteEvent>(wishdeletehandler);
  }
   final firestore=FirebaseFirestore.instance;
  List<Productmodel> wishproductlist=[];

  FutureOr<void> wishfetchhandler(HomewidgetcontrolEvent event, Emitter<HomewidgetcontrolState> emit)async {
    print('the index of 3');
     emit(wishLoadingstate());
        wishproductlist.clear();
      final wishlistcollection=await firestore.collection('users').doc(userid).collection('wishlist').get();

      if(wishlistcollection.docs.isEmpty){
        emit(WishlistEmptystate());
      }
      else{
      for(var document in wishlistcollection.docs){
        final data=document.data();

        final wishproduct=Productmodel(
        brand: data['brand'], 
        name: data['name'],
         category: data['category'],
          description: data['description'],
           price: data['price'], 
           quantitiy: data['quantity'], 
           imageurl:data['imageurl']);

           wishproductlist.add(wishproduct);
      }
      print('the wishsuccess');
      emit(Wishsuccessstate(wishlist: wishproductlist));
      print('the wishsuccess 2:$wishproductlist');
    }}

  FutureOr<void> wishdeletehandler(WishdeleteEvent event, Emitter<HomewidgetcontrolState> emit)async {
    await firestore.collection('users').doc(userid).collection('wishlist').doc(event.id).delete();
  }
}

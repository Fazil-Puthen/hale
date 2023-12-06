import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Models/usermodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:meta/meta.dart';

part 'homewidgetcontrol_event.dart';
part 'homewidgetcontrol_state.dart';

class HomewidgetcontrolBloc extends Bloc<HomewidgetcontrolEvent, HomewidgetcontrolState> {
  HomewidgetcontrolBloc() : super(HomewidgetcontrolInitial()) {
    on<HomewidgetcontrolEvent>((event, emit) {
  
    });
    on<Wishfetchevent>(wishfetchhandler);
    on<WishdeleteEvent>(wishdeletehandler);
     on<ProfileinitEvent>(profileinithandler);
     on<UpdateprofileEvent>(updateprofilehandler);
  }
   final firestore=FirebaseFirestore.instance;
  List<Productmodel> wishproductlist=[];

  FutureOr<void> wishfetchhandler(HomewidgetcontrolEvent event, Emitter<HomewidgetcontrolState> emit)async {
     emit(WishLoadingstate());
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
      emit(Wishsuccessstate(wishlist: wishproductlist));
    }}

  FutureOr<void> wishdeletehandler(WishdeleteEvent event, Emitter<HomewidgetcontrolState> emit)async {
    await firestore.collection('users').doc(userid).collection('wishlist').doc(event.id).delete();
  }

  FutureOr<void> profileinithandler(ProfileinitEvent event, Emitter<HomewidgetcontrolState> emit) async{
   emit(Profileloadingstate());
   final profile=await firestore.collection('users').doc(userid).get();

   if(profile.exists){
   Map<String,dynamic> userprofile=profile.data()!;

   final userdata=Usermodel(
    phone: userprofile['Phone'],
    mail: userprofile['Mail'],
    name: userprofile['Name']);
   
   emit(ProfileinintSuccessstate(userdata: userdata));
   }
   else{
    emit(ProfileFetchErrorstate());
   }
  }

  FutureOr<void> updateprofilehandler(UpdateprofileEvent event, Emitter<HomewidgetcontrolState> emit)async {
   emit(Profileloadingstate());

   final userprofile= firestore.collection('users').doc(userid);
   await userprofile.update({
    'Name':event.name,
    'Phone':event.phone,});

    await profileinithandler(ProfileinitEvent(), emit);
  }
}

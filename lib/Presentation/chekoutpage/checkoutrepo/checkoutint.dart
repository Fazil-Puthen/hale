import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/chekoutpage/bloc/checkout_bloc.dart';
import 'package:hale/common_widgets/constants.dart';

 List<Productmodel> chekoutlist = [];
 final fireestore = FirebaseFirestore.instance.collection('users').doc(userid);
 List<Adressmodel> adresslist = [];
 bool adress = false;

Future<void> checkoutinit(Emitter<CheckoutState> emit)async{
  emit(Checkoutloadingstate());
    int totalamount = 0;
    chekoutlist.clear();
    adresslist.clear();
    final orderSummary = await fireestore.collection('cart').get();
    final adressSnapshot = await fireestore.collection('adress').get();
    if (adressSnapshot.docs.isNotEmpty) {
      adress = true;
    }
    for (var document in orderSummary.docs) {
      final data = document.data();

      final checkoutproduct = Productmodel(
          brand: data['brand'],
          name: data['name'],
          category: data['category'],
          description: data['description'],
          price: data['price'],
          quantitiy: data['quantity'],
          imageurl: data['imageurl'],
          cartquantity: data['cartquantity'],
          quantitypricechange: data['quantityprice']);

      chekoutlist.add(checkoutproduct);

      totalamount += data['quantityprice'] as int;
    }

    for (var adress in adressSnapshot.docs) {
      final data = adress.data();

      final adresses = Adressmodel(
          housename: data['housename'],
          place: data['place'],
          pincode: data['pincode']);

      adresslist.add(adresses);
    }
    emit(Checkoutinitstate(
      checkoutlist: chekoutlist,
      adreslist: adresslist,
      isAdress: adress,
      totslamonut: totalamount,
    ));
}
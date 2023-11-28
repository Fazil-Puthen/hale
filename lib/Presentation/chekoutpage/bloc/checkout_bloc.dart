import 'dart:async';
import 'dart:convert';



import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/paymentresponse%20pages/payfailed.dart';
import 'package:hale/Presentation/paymentresponse%20pages/paysuccess.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final Razorpay _razorpay = Razorpay();
  CheckoutBloc() : super(CheckoutInitial()) {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    on<CheckoutEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CheckoutInitevent>(checkoutinithandler);
    on<PaymentButtonevent>(paymenthandler);
    // on<SelectadressEvent>(selectadresshandler);
  }
  //variables
  final fireestore = FirebaseFirestore.instance.collection('users').doc(userid);
  List<Productmodel> chekoutlist = [];
  List<adressmodel> adresslist = [];
  bool adress = false;
  late BuildContext ctx;
  final List<Map<String,dynamic>> orderlist=[];
  late int totalamount;
  //checkoutpageinit
  FutureOr<void> checkoutinithandler(
      CheckoutInitevent event, Emitter<CheckoutState> emit) async {
    emit(checkoutloadingstate());
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

      final adresses = adressmodel(
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

  // FutureOr<void> selectadresshandler(SelectadressEvent event, Emitter<CheckoutState> emit)async {
  //   emit(Adressloadingstate());
  //   emit(Adressfetchstate(index: event.index));
  // }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    orderlist.clear();
    DateTime now=DateTime.now();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(
      builder: (ctx)=>Paysuccess(orderid: response.orderId!,paymentid: response.paymentId!,)),
     (route) => false);
     final cartlist=await fireestore.collection('cart').get();
     for(var document in cartlist.docs){
      final data=document.data();
      
      // final orderlist=Productmodel(
      // brand:data['brand'] , 
      // name: data['name'],
      // category: data['category'],
      // description: data['description'],
      // price: data['price'],
      // quantitiy: data['quantity'],
      // imageurl: data['imageurl'],
      // quantitypricechange: data['quantityprice'],
      // cartquantity: data['cartquantity']);

      Map<String,dynamic> orderitem={
      'brand':data['brand'] , 
      'name': data['name'],
      'category': data['category'],
      'description': data['description'],
      'price': data['price'],
      'quantitiy': data['quantity'],
      'imageurl': data['imageurl'],
      'quantitypricechange': data['quantityprice'],
      'cartquantity': data['cartquantity']
      };
      print('this is orderitem $orderitem');
      orderlist.add(orderitem);
      print('this is orderlist $orderlist');

      await document.reference.delete();
      }
      await fireestore.collection('orders').doc(response.orderId).set({
       'orderid':response.orderId,
       'totalprice':totalamount,
       'paymentid':response.paymentId,
       'date':'${now.day}/${now.month}/${now.year}',
       'items':orderlist,
      });
     }
  

  void _handlePaymentError(PaymentFailureResponse response) {
     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const Payfailed()),
     (route) => false);
    print('payment failed because');
    print('this is the response error ${response.message.toString()}');
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print('external wallet ');
    
  }

  FutureOr<void> paymenthandler(
      PaymentButtonevent event, Emitter<CheckoutState> emit)async {
        totalamount=event.totalamount;
        ctx=event.context;
        final Map<String,dynamic> orderData={
          'amount':event.totalamount*100,
          'currency':'INR',
        };
        String orderurl='https://api.razorpay.com/v1/orders';
        String apiKey='rzp_test_nM68zH2XZye9nT';
        String apisecret='Bto2xu0W4zxJraATxOTjl9Bp';
        final String combinedkey='$apiKey:$apisecret';
        final String base64key=base64Encode(utf8.encode(combinedkey));
       
       try{
       final response=await http.post(Uri.parse(orderurl),
       headers: {
         'Content-Type': 'application/json',
        'Authorization': 'Basic $base64key'
       },
       body: json.encode(orderData));
       final responsebody=json.decode(response.body);
       var options = {
      'key': 'rzp_test_nM68zH2XZye9nT',
      'amount': 10000, //in the smallest currency sub-unit.
      'name': 'Hale fashions.',
      'order_id': responsebody['id'], // Generate order_id using Orders API
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {'contact': '799879997', 'email': 'halefashions@hale.com'},
      'theme': {'color': '#FFC0CB', 'backdrop_color': '#eb34e5'}
    };
      _razorpay.open(options);
    
       print('this is api orderid ${responsebody}');
       }
       catch(error){
        print('this is the error $error');
       }
       
       

    
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }
}

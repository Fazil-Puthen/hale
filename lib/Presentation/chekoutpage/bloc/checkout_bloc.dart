import 'dart:async';




import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/chekoutpage/checkoutrepo/checkoutint.dart';
import 'package:hale/Presentation/chekoutpage/checkoutrepo/paymentstart.dart';
import 'package:hale/Presentation/chekoutpage/checkoutrepo/paymentsuccess.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/paymentresponse%20pages/payfailed.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

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
  List<Adressmodel> adresslist = [];
  bool adress = false;
  late BuildContext ctx;
  final List<Map<String,dynamic>> orderlist=[];
  late int totalamount;
 
  //checkoutpageinit
  FutureOr<void> checkoutinithandler(
      CheckoutInitevent event, Emitter<CheckoutState> emit) async {
    await checkoutinit(emit);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
      await paysuccess(ctx, response,totalamount);
     }
  

  void _handlePaymentError(PaymentFailureResponse response) {
     Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>const Payfailed()),
     (route) => false);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    
  }
  
  //payment start
  FutureOr<void> paymenthandler(
      PaymentButtonevent event, Emitter<CheckoutState> emit)async {
        totalamount=event.totalamount;
        ctx=event.context;
        try{
      await paymentstart(ctx, totalamount, event, _razorpay);}
      catch(error){
        emit(RazorpayErrorstate());
      }
  }

  @override
  Future<void> close() {
    _razorpay.clear();
    return super.close();
  }
}

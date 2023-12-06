import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:hale/Presentation/chekoutpage/bloc/checkout_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';

Future<void>paymentstart(
  BuildContext ctx,
  int totalamount,
  PaymentButtonevent event,
  Razorpay _razorpay,
)async{
    totalamount=event.totalamount;
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
       }
       catch(error){
        print('this is the error $error');
       }
}
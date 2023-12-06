 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/paymentresponse%20pages/paysuccess.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

final List<Map<String,dynamic>> orderlist=[];
 final fireestore = FirebaseFirestore.instance.collection('users').doc(userid);


Future<void> paysuccess(
  BuildContext ctx,
  PaymentSuccessResponse response,
  int totalamount,
)async{
    orderlist.clear();
    DateTime now=DateTime.now();
    Navigator.of(ctx).pushAndRemoveUntil(MaterialPageRoute(
      builder: (ctx)=>Paysuccess(orderid: response.orderId!,paymentid: response.paymentId!,)),
     (route) => false);
     final cartlist=await fireestore.collection('cart').get();
     for(var document in cartlist.docs){
      final data=document.data();
      
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
      // print('this is orderitem $orderitem');
      orderlist.add(orderitem);
      // print('this is orderlist $orderlist');

      await document.reference.delete();
      }
      await fireestore.collection('orders').doc(response.orderId).set({
       'orderid':response.orderId,
       'totalprice':totalamount,
       'paymentid':response.paymentId,
       'date':'${now.day}/${now.month}/${now.year}',
       'items':orderlist,
      });
      await FirebaseFirestore.instance.collection('orders').doc().set({
       'userid':userid,
      //  'username':username,
       'orderid':response.orderId,
       'totalprice':totalamount,
       'paymentid':response.paymentId,
       'date':'${now.day}/${now.month}/${now.year}',
       'items':orderlist,
       'status':'pending',
      });
}
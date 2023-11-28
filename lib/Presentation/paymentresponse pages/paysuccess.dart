import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:lottie/lottie.dart';

class Paysuccess extends StatefulWidget {
  final String orderid,paymentid;
  const Paysuccess({super.key,required this.orderid,
  required this.paymentid});

  @override
  State<Paysuccess> createState() => _PaysuccessState();
}

class _PaysuccessState extends State<Paysuccess> {

@override
  void initState() {
    timeout();
    super.initState();
  }
  void timeout()async{
    await Future.delayed(Duration(seconds: 6));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
         icon: Icon(Icons.home_outlined,size: 20,)),
        title: Image.asset(hale,scale: 6,),
        centerTitle: true,
      ),

    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Lottie.asset(
              'assets/animation/paysuccess.json',
              height: 200,
              width: 200,
              repeat: false,
            ),
          Text('Order placed',style: detailfont(20,Colors.green.shade700,FontWeight.bold),),
          box,
          Text('order id: ${widget.orderid}',style: detailfont(13,Colors.black,FontWeight.w400),),
          SizedBox(height: 5,),
          Text('payment id: ${widget.paymentid}',style: detailfont(13,Colors.black,FontWeight.w400)),
          SizedBox(height: 15,),
          Text('You can track your order in your orders section',style: detailfont(10,Colors.blue,FontWeight.w400)),
        ],
      ),
    ),
    );
  }
}
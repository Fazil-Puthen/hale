import 'package:flutter/material.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:lottie/lottie.dart';

class Payfailed extends StatefulWidget {
  const Payfailed({super.key});

  @override
  State<Payfailed> createState() => _PaysuccessState();
}

class _PaysuccessState extends State<Payfailed> {

@override
  void initState() {
    timeout();
    super.initState();
  }
  void timeout()async{
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement((MaterialPageRoute(builder: (ctx)=>const HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){},
         icon: const Icon(Icons.home_outlined,size: 20,)),
        title: Image.asset(hale,scale: 6,),
        centerTitle: true,
      ),

    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Lottie.asset(
              'assets/animation/payfailed2.json',
              height: 100,
              width: 100,
              repeat: false,
            ),
          Text('Order not placed',style: detailfont(20,Colors.red,FontWeight.bold),),
          box,
          Text('Payment Failed',style: detailfont(17,Colors.black,FontWeight.w400),),
          const SizedBox(height: 5,),
          Text('Payment was not completed',style: detailfont(13,Colors.red,FontWeight.w400)),
          Text('please try again after some time',style: detailfont(12,Colors.red,FontWeight.w400)),
        ],
      ),
    ),
    );
  }
}
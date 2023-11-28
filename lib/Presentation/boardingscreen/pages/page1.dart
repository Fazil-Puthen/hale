import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:lottie/lottie.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.pink.withOpacity(0.1),
    body: Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Lottie.asset('assets/animation/hinew.json',
        height: 200,
        width: 200,
        repeat: true,),
        SizedBox(height: 25,),
        Text('Welcome $username',style: detailfont(15,Colors.black,FontWeight.w400),)
      ],),
    ),);
  }
}
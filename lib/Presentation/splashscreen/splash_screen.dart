import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class Splashscreen extends StatelessWidget {
 Splashscreen({super.key});
 final user=FirebaseAuth.instance; 

  @override
  Widget build(BuildContext context) {
    final logged=user.currentUser;
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body:FlutterSplashScreen.scale(
        animationDuration: const Duration(seconds: 4),
        duration:const  Duration(seconds: 5),
          backgroundColor: Colors.white,
          childWidget: SizedBox(
            height: screenwidth*0.7,
            width: screenheight*0.7,
            child: Image.asset("assets/Hale.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          defaultNextScreen:logged != null?HomeScreen():LoginPage()
        ),
    );
  }
}

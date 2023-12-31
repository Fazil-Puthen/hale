import 'package:flutter/material.dart';
import 'package:hale/Presentation/boardingscreen/pages/page1.dart';
import 'package:hale/Presentation/boardingscreen/pages/page2.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Intropage extends StatefulWidget {
   const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
final PageController _controller=PageController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[ PageView(
          controller: _controller,
          children: const [Page1(),Page2(),],),
             Container(alignment: const Alignment(0, 0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(controller: _controller, count: 2,
                effect:const WormEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  dotColor: Colors.white,
                  activeDotColor: Colors.yellow,
                  type: WormType.thinUnderground
                ) ,),
                TextButton(onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (ctx)=>const HomeScreen()));
                },
                 child: Text('Skip',style: detailfont(13,Colors.blue.shade700,FontWeight.w300),)),
                 const SizedBox(height: 25,)
              ],
            ))]
      ),
    );
  }
}

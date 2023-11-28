import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/orderspage/refracted%20widgets/orderlistcontainer.dart';

class Orderpage extends StatelessWidget {
  const Orderpage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: pinkcolor,
      appBar: AppBar(
        toolbarHeight: screenheight*0.08,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Image.asset(
              hale,
              scale: 6,
            ),
          ),
        ],
        title: Text(
          'Your Orders',
          style: cardfont,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: screenheight*0.88,
          width: screenwidth,
          color: pinkcolor,
          child: Padding(
            padding:const  EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 7,
            ),
            child: SizedBox(
              child: orderlistbuild(screenwidth),
            ),
          ),
        ),
      ),
    );
  }

}

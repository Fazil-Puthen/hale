import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
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
          'Checkout',
          style: cardfont,
        ),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Container(
          width: screenwidth,
          height: screenheight,
          color: pinkcolor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 10,
                  child: Container(width: screenwidth*0.9,
                  // height: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  // border: Border.all()
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('black shirt'),
                          Text('rs299')
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('white shirt shirt'),
                          Text('rs299')
                        ],
                      ),
                       Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('total'),
                          Text('rs879')
                        ],
                      )
                      
                    ],
                  )),
                ),
              ],
            ),
          ),
        ),
      ) ,
      );
  }
}
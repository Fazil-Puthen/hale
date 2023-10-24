import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';

class ShopWidget extends StatelessWidget {
  const ShopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Container(
      color: pinkcolor,
      width: screenwidth*0.9,
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: screenheight*0.45,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10),
       itemBuilder:(context, index) {
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal:10),
           child: Card(child: Container(
            width: screenwidth*0.4,
            child:  GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsScreen()));
              },
              child: Column(
                children: [const Image(image: AssetImage(woman)),
              Text('Womens jeans',style:cardfont,),
              Text('pack of 2',style: textfont,),
              Text('₹399',style: textfont,)],),
            ),
           ),),
         );
       },),
    );
  }
}
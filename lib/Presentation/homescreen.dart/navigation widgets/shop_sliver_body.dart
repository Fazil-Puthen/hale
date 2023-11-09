import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

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
        shrinkWrap: true,
        itemCount: 10,
        gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount(
        // childAspectRatio: .7,
        crossAxisCount: 2,
        mainAxisExtent: screenheight*0.45,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10),
       itemBuilder:(context, index) {
         return Padding(
           padding: const EdgeInsets.symmetric(horizontal:10),
           child: Card(child: GestureDetector(
             onTap: () {
              //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsScreen()));
             },
             child: Column(
               children: [
                 const ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                  child: Image(image: AssetImage(woman),fit: BoxFit.contain,)),
             Text('Womens jeans',style:cardfont,),
             Text('pack of 2',style: textfont,),
             Text('₹399',style: textfont,)],),
           ),),
         );
       },),
    );
  }
}
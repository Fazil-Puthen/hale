import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(appBar: AppBar(
      leading: Image.asset(hale,scale: 6,),
      title: Text('Womans Jeans',style: cardfont,),
      centerTitle: true,
    ),
      body: Container(width: screenwidth,
      height: double.maxFinite,
      color: pinkcolor,
      child:ListView(children: [
          Container(width:screenwidth,
          height: screenheight*0.5,
          color: Colors.white,
          child: Image.asset(woman),),
          box,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Womens Skinfit Jeans',style: headingfont,),
            
            box,
            Text('Rs.799 only/-',style: cardfont,),
            box,
            Wrap(children:[ Text('Slim-fit pants or skinny jeans (when made of denim) are tight trousers that have a snug fit through the legs and end in a small leg opening that can be anywhere from 9" to 20" in circumference, depending on size.',style: textfont,)]),
            box,

            dbox,
            Text('colors',style: headingfont,),
            Row(children: [CircleAvatar(backgroundColor: Colors.red,),
            wbox,
            CircleAvatar(backgroundColor: Colors.yellow,),
            wbox,
            CircleAvatar(backgroundColor: Colors.black,)],),
            dbox,
            Text('size',style: headingfont,),
            Row(children: [Text('X'),wbox,Text('XS'),wbox,Text('S'),wbox,Text('L')],),
            dbox,
              ],),
          )
        ],),
      ),);
  }
}
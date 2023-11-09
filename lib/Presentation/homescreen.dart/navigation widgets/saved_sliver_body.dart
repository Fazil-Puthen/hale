import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class WishWidget extends StatelessWidget {
  const WishWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth*0.8,
      height: double.maxFinite,
      color: pinkcolor,
      child:ListView.separated(itemBuilder:(context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
            child: ListTile(
              tileColor: Colors.white,
              leading: Image(image: AssetImage(sports)),
              title: Text('mens sports wear',style: cardfont,),
              subtitle: Text('pack of 3',style: textfont,),
              trailing: Text( '₹399',style: textfont,),
            ),
          ),
        );
      },
       separatorBuilder:(context,index)=>box,
        itemCount: 2) ,

    );
  }
}
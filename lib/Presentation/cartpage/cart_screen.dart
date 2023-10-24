import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
      leading: Image.asset(hale,scale: 6,),
      title: Text('Your Cart',style: cardfont,),
      centerTitle: true,
    ),
    body: ListView(
      children:[ Container(
        width: screenwidth,
        height: screenheight*0.76,
        color: pinkcolor,
        child:ListView.separated(itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
            child: Container(decoration: BoxDecoration(
              color:pinkcolor,
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
          itemCount: 9) ,
    
      ),
      Container(width: screenwidth,
      height: screenheight*0.15,
      color: pinkcolor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          child: ContainerButton(
            color: Colors.yellow.withOpacity(0.5),
            screenwidth: 100,
           screenheight: screenheight*0.1, heading: 'Checkout', onTap:(){}),
        ),
      )]
    ),
    );
  }
}
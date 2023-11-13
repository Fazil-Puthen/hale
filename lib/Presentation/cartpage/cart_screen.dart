import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/cartpage/bloc/cart_bloc.dart';
import 'package:hale/Presentation/cartpage/refracted%20widgets/cartcontainer.dart';
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
        actions:[ Padding(
          padding: const EdgeInsets.only(right: 5),
          child: Image.asset(
            hale,
            scale: 6,
          ),
        ),],
        title: Text(
          'Your Cart',
          style: cardfont,
        ),
        centerTitle: true,
      ),
      body: ListView(children: [
        Container(
          width: screenwidth,
          height: screenheight*0.7,
          color: pinkcolor,
          child: BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              if(state is CartsuccesState){
                final List<Productmodel> cartlist=state.cartproduct;
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: CartContainer(
                            screenwidth: screenwidth, cartlist: cartlist,index: index,));
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 0,
                      ),
                  itemCount: cartlist.length);}
                  else{
                    return const Center(child: Text('No products added'),);
                  }
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Total',style: detailfont(15,Colors.black,FontWeight.normal),),
              Text('rs298',style: detailfont(15,Colors.red,FontWeight.w600),)]),
              box,
        ContainerButton(
          screenwidth: screenwidth*0.8,
         screenheight: screenheight*0.07,
          heading: 'checkout',
           color: pinkcolor,
            onTap: (){})],
          ),
        ),
      ]),
    );
  }
}



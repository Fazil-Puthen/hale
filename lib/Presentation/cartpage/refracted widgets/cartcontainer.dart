import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/cartpage/bloc/cart_bloc.dart';
import 'package:hale/Presentation/cartpage/bloc/quantity_bloc.dart';
import 'package:hale/common_widgets/constants.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.screenwidth,
    required this.cartlist,
    required this.index,
  });

  final double screenwidth;
  final List<Productmodel> cartlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth * 0.8,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding:const  EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: Image.network(cartlist[index].imageurl[0]),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartlist[index].name,
                      style: detailfont(15, Colors.black, FontWeight.w400),
                    ),
                    Text(
                      cartlist[index].brand,
                      style: detailfont(10, Colors.black, FontWeight.w200),
                    )
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //price change
                BlocBuilder<QuantityBloc, QuantityState>(
                  builder: (context, state) {
                    if(state is Quantityaddedestate){
                      final quantitypricechange=state.cartlist[index].quantitypricechange;
                    return Text(
                      '₹ ${quantitypricechange.toString()}',
                      style: detailfont(13, Colors.red, FontWeight.w300),
                    );}
                    else{
                      return Text(
                        '₹ ${cartlist[index].quantitypricechange.toString()}',
                              style: detailfont(13, Colors.red, FontWeight.w300),
                            );
                    }
                  },
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: .5),
                      borderRadius: BorderRadius.circular(5)),
                  width: 80,
                  height: 25,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<QuantityBloc>().add(Quantityaddordelete(
                              quantitycontrol: Addordelete.delete,
                              quantitiy: cartlist[index].cartquantity!,
                              productid: cartlist[index].name,
                              cartlist: cartlist,
                              index: index));
                              context.read<CartBloc>().add(Cartfetchevent(userid: userid));
                        },
                        child: const Icon(
                          Icons.delete_outline,
                          size: 15,
                        ),
                      ),
                      //quantity change
                      BlocBuilder<QuantityBloc, QuantityState>(
                        builder: (context, state) {
                          if (state is Quantityaddedestate) {
                            final newquantity =
                                state.cartlist[index].cartquantity;
                            return Text(
                              newquantity.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue),
                            );
                          } else {
                            return Text(
                              cartlist[index].cartquantity.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            );
                          }
                        },
                      ),
                      InkWell(
                        onTap: () {
                          context.read<QuantityBloc>().add(Quantityaddordelete(
                              quantitycontrol: Addordelete.add,
                              quantitiy: cartlist[index].cartquantity!,
                              productid: cartlist[index].name,
                              cartlist: cartlist,
                              index: index));
                               context.read<CartBloc>().add(Cartfetchevent(userid: userid));
                        },
                        child: const Icon(
                          Icons.add,
                          size: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

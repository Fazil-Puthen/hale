import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class CheckoutTile extends StatelessWidget {
  const CheckoutTile({
    super.key,
    required this.screenwidth,
    required this.checkouttlist,
    required this.index,
  });

  final double screenwidth;
  final List<Productmodel> checkouttlist;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth * 0.8,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        border: Border.all(width: .5,color: Colors.black.withOpacity(0.1)),
        color: Colors.white,
      ),
      child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    child: Image.network(checkouttlist[index].imageurl[0]),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        checkouttlist[index].name,
                        style: detailfont(15, Colors.black, FontWeight.w400),
                      ),
                      Text(
                        checkouttlist[index].brand,
                        style: detailfont(10, Colors.black, FontWeight.w200),
                      ),
                      Text(
                        '₹ ${checkouttlist[index].price.toString()}',
                        style: detailfont(15, Colors.black, FontWeight.normal),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //price change

                    Text(
                      'Qty: ${checkouttlist[index].cartquantity}',
                      style: detailfont(13, Colors.black, FontWeight.w300),
                    ),
                    Text(
                      '₹ ${checkouttlist[index].quantitypricechange.toString()}',
                      style: detailfont(13, Colors.red, FontWeight.w300),
                    ),
                  ]),
            ],
          )),
    );
  }
}

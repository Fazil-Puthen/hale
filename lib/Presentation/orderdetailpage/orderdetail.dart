import 'package:flutter/material.dart';
import 'package:hale/Models/ordermodel.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/checkouttile.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class OrderDetailpage extends StatelessWidget {
  final Ordermodel orderitem;
  const OrderDetailpage({super.key,required this.orderitem});

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
          'Order Detail',
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
             child: Column(children: [
              Text(
                        'Order date: ${orderitem.date}',
                        style: detailfont(13, Colors.black, FontWeight.w400)),
                        box,
                      Text(
                        'order id: ${orderitem.orderid}',
                        style: detailfont(13, Colors.black, FontWeight.w400),
                      ),
                      Text('payment id: ${orderitem.paymentid}',
                          style: detailfont(13, Colors.black, FontWeight.w400)),
                          box,
                          SizedBox(
                        width: screenwidth * 0.9,
                        height: screenwidth * 0.6,
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                           return Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                            color: Colors.white,),
                             child: ListTile(
                              leading: SizedBox(
                              width: 50,
                              height: 50,
                              child: Image.network(orderitem.items[index]['imageurl'][0])),
                             title: Text(orderitem.items[index]['name'],
                             style: detailfont(13,Colors.black,FontWeight.w300)),
                             subtitle: Text('₹ ${orderitem.items[index]['price'].toString()}',
                             style: detailfont(14,Colors.red,FontWeight.w300)),
                             trailing: Column(mainAxisSize: MainAxisSize.min,
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                             Text('Qty: ${orderitem.items[index]['cartquantity'].toString()}nos',
                             style: detailfont(13,Colors.black,FontWeight.w300),),
                             Text('Paid:₹ ${orderitem.items[index]['quantitypricechange'].toString()}',
                             style: detailfont(13,Colors.red,FontWeight.w300),)],),),
                           );
                          },
                          separatorBuilder: (context, index) => box,
                          itemCount: orderitem.items.length,
                          )
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            width: screenwidth*0.7,
                            height: 25,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Total amount paid: ',
                                style: detailfont(15,Colors.black,FontWeight.w500),),
                                 Text('₹ ${orderitem.totalamount}/- ',
                                style: detailfont(15,Colors.red,FontWeight.w500),),
                              ],
                            ),
                          )
             ]),
            ),
          ),
        ),
      ),
    );
  }

}

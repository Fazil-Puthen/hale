import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/orderspage/bloc/orders_bloc.dart';

class OrderDetailpage extends StatelessWidget {
  // final Ordermodel orderitem;
  final String docid;
  const OrderDetailpage({super.key,
  // required this.orderitem,
  required this.docid});

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
          child: StreamBuilder(stream: FirebaseFirestore.instance.collection('users').doc(userid).
          collection('orders').doc(docid).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(snapshot.hasError){
              return const Center(child: Text('error loading data'),);
            }
            else if(snapshot.connectionState==ConnectionState.none){
              return const Center(child: Text('no data'),);
            }
            else if(snapshot.hasData){
              if(snapshot.data!.exists){
              final Map<String,dynamic> value=snapshot.data!.data() as Map<String,dynamic>;
            return Padding(
              padding:const  EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 7,
              ),
              child: SizedBox(
               child: Column(children: [
                Text(
                          'Order date: ${value['date']}',
                          style: detailfont(13, Colors.black, FontWeight.w400)),
                          box,
                        Text(
                          'order id: ${value['orderid']}',
                          style: detailfont(13, Colors.black, FontWeight.w400),
                        ),
                        Text('payment id: ${value['paymentid']}',
                            style: detailfont(13, Colors.black, FontWeight.w400)),
                            box,
                            SizedBox(
                          width: screenwidth * 0.9,
                          height: screenwidth * 0.6,
                          child: ListView.separated(
                            itemBuilder: (context, index) {
                             return Slidable(
                              startActionPane:ActionPane(motion: const StretchMotion(),
                               children:[
                                SlidableAction(onPressed: (context){
                                  showDialog(context: context, builder:(context) {
                                    return AlertDialog(title:Text('Confirm Cancel?',
                                    style: detailfont(14,Colors.red,FontWeight.w300),),
                                    content: Text('Do you wish to cancel order- ${value['items'][index]['name']}',
                                    style: detailfont(12,Colors.black,FontWeight.w200),),
                                    actions: [TextButton(onPressed: (){
                                      Navigator.pop(context);

                                    }, child:Text('No',style: detailfont(10,Colors.blue,FontWeight.w200),)),
                                    TextButton(onPressed: (){
                                  context.read<OrdersBloc>().add(DeleteItemEvent(index: index,
                                  docId:docid,
                                  ctx: context));
                                   Navigator.pop(context);
                                    },
                                     child:Text('cancel',style: detailfont(10,Colors.red,FontWeight.w200),))],);
                                  },);
                                },
                                backgroundColor: Colors.red,
                                icon: Icons.cancel,
                                label: 'Cancel',)
                               ]) ,
                               child: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                                color: Colors.white,),
                                 child: ListTile(
                                  leading: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.network(value['items'][index]['imageurl'][0])),
                                 title: Text(value['items'][index]['name'],
                                 style: detailfont(13,Colors.black,FontWeight.w300)),
                                 subtitle: Text('₹ ${value['items'][index]['price'].toString()}',
                                 style: detailfont(14,Colors.red,FontWeight.w300)),
                                 trailing: Column(mainAxisSize: MainAxisSize.min,
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                 Text('Qty: ${value['items'][index]['cartquantity'].toString()}nos',
                                 style: detailfont(13,Colors.black,FontWeight.w300),),
                                 Text('Paid:₹ ${value['items'][index]['quantitypricechange'].toString()}',
                                 style: detailfont(13,Colors.red,FontWeight.w300),)],),),
                               ),
                             );
                            },
                            separatorBuilder: (context, index) => box,
                            itemCount: value['items'].length,
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
                                   Text('₹ ${value['totalprice']}/- ',
                                  style: detailfont(15,Colors.red,FontWeight.w500),),
                                ],
                              ),
                            )
               ]),
              ),
            );}
            else{
              return const Center(child: Text('No orders to view'),);
            }
            }
            else{
              return const SizedBox();
            }
            }
          ),
        ),
      ),
    );
  }

}

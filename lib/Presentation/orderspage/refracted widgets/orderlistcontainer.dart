import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/orderdetailpage/orderdetailsceen.dart';
import 'package:hale/Presentation/orderspage/bloc/orders_bloc.dart';

BlocBuilder<OrdersBloc, OrdersState> orderlistbuild(double screenwidth) {
    return BlocBuilder<OrdersBloc, OrdersState>(
      builder: (context, state) {
        if(state is Orderloadingstate){
          return const Loadingwidget();
        }
        else if(state is OrdereEmptystate){
          return Center(
            child: Text('No Orders yet',
            style: detailfont(15,Colors.black,FontWeight.w400),),
          );
        }
        else if (state is Orderfetchedstate) {
          final orderlist = state.orderlist;
          return ListView.separated(
            itemBuilder: (context, index) {
              int viewheight = orderlist[index].items.length;
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                width: screenwidth * 0.9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ Text(
                        'Order date: ${orderlist[index].date}',
                        style: detailfont(13, Colors.black, FontWeight.w400)),
                        box,
                      Text(
                        'order id: ${orderlist[index].orderid}',
                        style: detailfont(13, Colors.black, FontWeight.w400),
                      ),
                      Text('payment id: ${orderlist[index].paymentid}',
                          style: detailfont(13, Colors.black, FontWeight.w400)),
                      const Divider(
                        thickness: 0.5,
                        endIndent: 1,
                        indent: 1,
                      ),
                      SizedBox(
                        width: screenwidth * 0.9,
                        height: screenwidth * viewheight*0.2,
                        child: ListView.builder(
                          itemBuilder: (context, itemindex) {
                            return Container(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: Image.network(orderlist[index]
                                              .items[itemindex]['imageurl'][0])),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            orderlist[index].items[itemindex]
                                                ['name'],
                                            style: detailfont(14, Colors.black,
                                                FontWeight.w300),
                                          ),
                                          Text(
                                            'Qty ${orderlist[index].items[itemindex]['cartquantity'].toString()}',
                                            style: detailfont(
                                                12, Colors.red, FontWeight.w200),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: screenwidth * 0.2,
                                      ),
                                    ],
                                  ),
                                  box,
                                ],
                              ),
                            );
                          },
                          itemCount: orderlist[index].items.length,
                        ),
                      ),
                     InkWell(
                      onTap: () {
                        Navigator.of(context).
                        push(MaterialPageRoute(builder:(ctx)=>OrderDetailpage(docid: orderlist[index].docId,)));
                      },
                       child: Container(width: 100,
                       height: 25,
                       decoration: BoxDecoration(
                        border:Border.all(width: 0.5) ,
                        borderRadius: BorderRadius.circular(3)),
                        child: Center(child: Text('View Details',style: detailfont(10,Colors.pink, 
                        FontWeight.w200),),),),
                     ),
                      box,
                    
                      Text('₹ ${orderlist[index].totalamount}',style: detailfont(13,Colors.red,FontWeight.w500),)
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => box,
            itemCount: orderlist.length,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

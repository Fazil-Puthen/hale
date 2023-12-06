import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/chekoutpage/bloc/checkout_bloc.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/adresschangewidget.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/checkouttile.dart';
import 'package:hale/common_widgets/constants.dart';


class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
          'Order Summary',
          style: cardfont,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: screenwidth,
          height: screenheight,
          color: pinkcolor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AdressSelectcontainer(
                  screenwidth: screenwidth,
                  screenheight: screenheight,
                ),
                box,
                BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if(state is RazorpayErrorstate){
                      showDialog(context: context, builder:(context) {
                        return const AlertDialog(
                          title: Text('Razorpay not responding'),
                          content: Text('Try after some time'),
                        );
                      });
                    }
                  },
                  builder: (context, state) {
                    return BlocBuilder<CheckoutBloc, CheckoutState>(
                      builder: (context, state) {
                        if (state is Checkoutloadingstate) {
                          return const Center(
                            child: Loadingwidget(),
                          );
                        } else if (state is Checkoutinitstate) {
                          final List<Productmodel> chekoutlist =
                              state.checkoutlist;
                          // final List<Adressmodel> adreslist = state.adreslist;
                          return SizedBox(
                            width: screenwidth * 0.95,
                            height: screenheight * 0.8,
                            child: ListView.builder(
                              itemCount: chekoutlist.length,
                              itemBuilder: (context, index) {
                                return CheckoutTile(
                                    screenwidth: screenwidth,
                                    checkouttlist: chekoutlist,
                                    index: index);
                              },
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is Checkoutinitstate) {
            final total = state.totslamonut;
            return BottomAppBar(
              color: Colors.white,
              height: 70,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '₹ $total',
                        style: detailfont(15, Colors.red, FontWeight.w500),
                      ),
                      Text(
                        'GST is exclusive',
                        style: detailfont(10, Colors.black, FontWeight.w500),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if(state.isAdress==true){
                        context.read<CheckoutBloc>().add(PaymentButtonevent(
                            context: context, totalamount: total));}
                      else{
                        showDialog(context: context,
                         builder: (BuildContext context){
                          return AlertDialog(title:Text('Please Add an Adress before payment',
                          style: detailfont(12,Colors.red,FontWeight.w300),),
                          actions: [TextButton(onPressed: (){
                            Navigator.pop(context);
                          },
                           child: Text('Ok',style: detailfont(12,Colors.blue,
                            FontWeight.w300),))],);
                         });
                      }
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll<Color>(Colors.green)),
                      child: Text(
                        'Continue to payment',
                        style: detailfont(
                            13, Colors.yellow.shade600, FontWeight.w400),
                      ))
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}



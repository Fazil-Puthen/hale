import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/chekoutpage/bloc/adresscheckout_bloc.dart';
import 'package:hale/Presentation/chekoutpage/bloc/checkout_bloc.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/checkouttile.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/adressbottomsheet.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  // var _razorpay = Razorpay();

  @override
  void initState() {
    // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }

  // void _handlePaymentSuccess(PaymentSuccessResponse response) async {
  //   print('payment success');
  //   String orderid = response.paymentId!;
  //   print('orderid : $orderid');
  // }

  // void _handlePaymentError(PaymentFailureResponse response) {
  //   print('payment failed');
  // }

  // void _handleExternalWallet(ExternalWalletResponse response) {
  //   print('external wallet');
  // }

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
            child:
                // BlocBuilder<CheckoutBloc, CheckoutState>(
                //   builder: (context, state) {
                //     if (state is checkoutloadingstate) {
                //       return const Center(
                //         child: CircularProgressIndicator(),
                //       );
                //     } else if (state is Checkoutinitstate) {
                //       final List<Productmodel> chekoutlist = state.checkoutlist;
                //       final List<adressmodel> adreslist = state.adreslist;
                //       return
                Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // BlocBuilder<AdresscheckoutBloc, AdresscheckoutState>(
                //   builder: (context, state) {
                //     if(state is AdressloadingState){
                //       return const Center(child: CircularProgressIndicator(),);
                //     }
                //     else if(state is AdressInitstate){
                //       final adressindex=state.adressindex;
                //       print('adressindex:  $adressindex');
                //       final adreslist=state.adreslist;
                // return
                AdressSelectcontainer(
                  screenwidth: screenwidth,
                  // adreslist: adreslist,
                  screenheight: screenheight,
                  // index: adressindex,
                ),
                // }
                //     else{
                //       return SizedBox();
                //     }
                //   },
                // ),
                box,
                BlocBuilder<CheckoutBloc, CheckoutState>(
                  builder: (context, state) {
                    if (state is checkoutloadingstate) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is Checkoutinitstate) {
                      final List<Productmodel> chekoutlist = state.checkoutlist;
                      final List<adressmodel> adreslist = state.adreslist;
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
                      return SizedBox();
                    }
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
                        context.read<CheckoutBloc>().add(PaymentButtonevent(context: context
                        ,totalamount: total));
                        // String orderid = DateTime.now().toString();
                        // var options = {
                        //   'key': 'rzp_test_pX4iaG94SX5pl6',
                        //   'amount': 1, //in the smallest currency sub-unit.
                        //   'name': 'Hale Fashions',
                        //    'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API
                        //   'description': 'Fine T-Shirt',
                        //   'timeout': 60, // in seconds
                        //   'prefill': {
                        //     'contact': '9123456789',
                        //     'email': 'fazilkdr@gmail.com'
                        //   }
                        // };
                        // _razorpay.open(options);
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

  // @override
  // void dispose() {
  //   _razorpay.clear();
  //   super.dispose();
  // }
}

//adress change container
class AdressSelectcontainer extends StatelessWidget {
  const AdressSelectcontainer({
    super.key,
    required this.screenwidth,
    // required this.adreslist,
    required this.screenheight,
    // required this.index,
  });

  final double screenwidth;
  // final List<adressmodel> adreslist;
  final double screenheight;
  // final int index;

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<CheckoutBloc, CheckoutState>(
    //   builder: (context, state) {
    //     if (state is Adressfetchstate) {
    //       int index = state.index;
    return Container(
      width: screenwidth * 0.9,
      // height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: BlocBuilder<AdresscheckoutBloc, AdresscheckoutState>(
          builder: (context, state) {
            if(state is AdressloadingState){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is AdressInitstate){
              final adreslist=state.adreslist;
              final index=state.adressindex;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Deliver to this Adress :',
                      style: detailfont(13, Colors.black, FontWeight.bold),
                    ),
                    Text(
                      '  ${adreslist[index].housename}',
                      style: detailfont(13, Colors.black, FontWeight.w300),
                    ),
                    Text(
                      '   ${adreslist[index].place}',
                      style: detailfont(11, Colors.black, FontWeight.w100),
                    ),
                    Text(
                      '   ${adreslist[index].pincode}',
                      style: detailfont(11, Colors.black, FontWeight.normal),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          // context.read<CheckoutBloc>().add(SelectadressEvent());
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Adressbottomsheet(
                                  screenwidth: screenwidth,
                                  screenheight: screenheight,
                                  addreslist: adreslist,
                                  selectedindex: index,
                                );
                              });
                        },
                        child: Text(
                          'Change',
                          style: detailfont(12, Colors.blue, FontWeight.w300),
                        ))
                  ],
                )
              ],
            );}
            else{
              return SizedBox();
            }
          },
        ),
      ),
    );
    //     } else {
    //       return Container(
    //         width: screenwidth * 0.9,
    //         color: Colors.white,
    //         child: Padding(
    //           padding: EdgeInsets.all(10),
    //           child: Center(
    //             child: TextButton(
    //                 onPressed: () {},
    //                 child: TextButton(
    //                     onPressed: () {
    //                       showModalBottomSheet(
    //                           context: context,
    //                           builder: (BuildContext context) {
    //                             return Adressbottomsheet(
    //                               screenwidth: screenwidth,
    //                               screenheight: screenheight,
    //                               addreslist: adreslist,
    //                             );
    //                           });
    //                     },
    //                     child: Text('Select Adress'))),
    //           ),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}

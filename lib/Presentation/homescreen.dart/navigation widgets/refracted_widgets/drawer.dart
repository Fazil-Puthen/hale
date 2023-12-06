import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/address_screen.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/drawer_items.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:hale/Presentation/orderspage/bloc/orders_bloc.dart';
import 'package:hale/Presentation/orderspage/ordersscreen.dart';


class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.screewidth,
    required this.screenheight,
  });

  final double screewidth;
  final double screenheight;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: screewidth * 0.5,
      backgroundColor: Colors.white,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 5, vertical: screenheight * 0.1),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        backgroundImage: AssetImage(
                            hale),
                      ),
                      box,
                      Text(
                        username,
                        style: detailfont(12,Colors.black,FontWeight.bold),
                      ),
                      box,
                      Text(
                        userid,
                        style: textfont,
                      ),
                    ],
                  )),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              dbox,
              InkWell
              (onTap: (){
                context.read<OrdersBloc>().add(OrdersFetchevent());
                Navigator.push(context,MaterialPageRoute(builder: (ctx)=>const Orderpage()));
              },
                child: const DrawerItems(
                  icon: Icon(Icons.fire_truck),
                  label: 'Orders',
                ),
              ),
              dbox,
              const DrawerItems(icon: Icon(Icons.payment), label: 'Payment'),
              dbox,
              //Adress
              GestureDetector(
                onTap:(){ context.read<AdressBloc>().add(AdressfetchEvent());
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const AdressPage()));},
                child: const DrawerItems(icon: Icon(Icons.near_me), label: 'Adress')),
              dbox,
              //Signout
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state is Signoutstate){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginPage()), (route) => false);
                  }
                },
                child: InkWell(focusColor: Colors.amber,
                    onTap: () {
                      context.read<AuthBloc>().add(Signoutevent());
                    },
                    child: const DrawerItems(
                        icon: Icon(Icons.logout), label: 'Sign Out')),
              )
            ],
          ),
        ),
      ),
    );
  }
}

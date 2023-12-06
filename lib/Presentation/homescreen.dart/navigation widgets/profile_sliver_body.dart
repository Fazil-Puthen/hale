import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/usermodel.dart';
import 'package:hale/Presentation/Address%20page/address_screen.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/homewidgetcontrol_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/profileeditbox.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/profilesetting.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/orderspage/bloc/orders_bloc.dart';
import 'package:hale/Presentation/orderspage/ordersscreen.dart';
import 'package:hale/common_widgets/constants.dart';

class ShopWidget extends StatefulWidget {
  const ShopWidget({super.key});

  @override
  State<ShopWidget> createState() => _ShopWidgetState();
}

class _ShopWidgetState extends State<ShopWidget> {
  @override

  void initState() {
    context.read<HomewidgetcontrolBloc>().add(ProfileinitEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      // color: pinkcolor,
      width: screenwidth * 0.9,
      child: BlocBuilder<HomewidgetcontrolBloc, HomewidgetcontrolState>(
        builder: (context, state) {
          if(state is Profileloadingstate){
            return const Loadingwidget();
          }
          else if(state is ProfileFetchErrorstate){
            return const Center(child: Text('Error loading profile'),);
          }
          else if(state is ProfileinintSuccessstate) {
            Usermodel user=state.userdata;
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    dbox,
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  user.name,
                                  style: headingfont,
                                ),
                                IconButton(onPressed: (){
                                  TextEditingController namecontroller=TextEditingController();
                                  TextEditingController phonecontroller=TextEditingController();
                                  namecontroller.text=user.name;
                                  phonecontroller.text=user.phone;
                                  showDialog(context: context,
                                   builder:(context) {
                                     return ProfileAlertbox(
                                      namecontroller: namecontroller, 
                                      phonecontroller: phonecontroller,
                                       head: 'Update Profile',
                                        buttonhint:'Update');
                                   },);
                                },
                                 icon: const Icon(Icons.edit,size: 15,color: Colors.amber,))
                              ],
                            ),
                            Text(
                              'Mail: ${user.mail}',
                              style: cardfont,
                            ),
                            Text(
                              'phone: +91 ${user.phone} ',
                              style: cardfont,
                            )
                          ],
                        )
                      ],
                    ),
                    dbox,
                    const Divider(
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {
                        context.read<AdressBloc>().add(AdressfetchEvent());
                        Navigator.push(context,MaterialPageRoute(builder: (ctx)=>const AdressPage()));
                      },
                      child:const ProfileSettings(
                        icon: Icons.location_on_outlined,
                        text: 'Shipping Address',
                      ),
                    ),
                    // dbox,
                    // ProfileSettings(
                    //     icon: Icons.payment, text: 'Payment Methods'),
                    // dbox,
                    // InkWell(
                    //   onTap: () {
                    //      Navigator.push(context,MaterialPageRoute(builder: (ctx)=>AdressPage()));
                    //   },
                    //   child: const ProfileSettings(
                    //       icon: Icons.favorite, text: 'Wishlist'),
                    // ),
                    dbox,
                    InkWell(
                      onTap: () {
                         context.read<OrdersBloc>().add(OrdersFetchevent());
                         Navigator.push(context,MaterialPageRoute(builder: (ctx)=>const Orderpage()));
                      },
                      child: const ProfileSettings(
                          icon: Icons.shopping_cart_checkout, text: 'Orders'),
                    ),
                    dbox,
                    InkWell(
                      onTap: () {
                        context.read<AuthBloc>().add(Signoutevent());
                      },
                      child: const ProfileSettings(icon: Icons.logout, text: 'Logout'))
                  ],
                ),
              )
            ],
          );}
          else{
            return const SizedBox();
          }
        },
      ),
    );
  }
}

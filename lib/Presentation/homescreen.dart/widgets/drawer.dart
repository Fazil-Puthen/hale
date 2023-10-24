import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/widgets/drawer_items.dart';
import 'package:hale/Presentation/login_or_signup/auth_bloc/auth_bloc.dart';
import 'package:hale/Presentation/login_or_signup/login_screen.dart';
import 'package:hale/Presentation/profile_screen/profile_screen.dart';

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
                            'assets/full-length-cheerful-woman-denim-clothes-posing-white-wall.jpg'),
                      ),
                      box,
                      Text(
                        'Fazil Puthen',
                        style: textfont,
                      ),
                      box,
                      Text(
                        'fazilkdr@gmail.com',
                        style: textfont,
                      ),
                    ],
                  )),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              dbox,
              const DrawerItems(
                icon: Icon(Icons.fire_truck),
                label: 'Orders',
              ),
              dbox,
              const DrawerItems(icon: Icon(Icons.payment), label: 'Payment'),
              dbox,
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>ProfilePage()));
                },
                child: const DrawerItems(
                    icon: Icon(Icons.face_5_outlined), label: 'Profile'),
              ),
              dbox,
              const DrawerItems(icon: Icon(Icons.near_me), label: 'Adress'),
              dbox,
              BlocListener<AuthBloc, AuthState>(
                listener: (context, state) {
                  if(state is Signoutstate){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=>LoginPage()), (route) => false);
                  }
                },
                child: GestureDetector(
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

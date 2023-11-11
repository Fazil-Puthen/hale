import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 10,top: 20),
          child: Text('Profile',style: cardfont,),
        ),
        // leading: DrawerWidget(screewidth: screenwidth*0.5, 
        // screenheight: screenheight),
        title: Image.asset(hale,scale:4,),
        centerTitle: true,
      ),
      body: Container(
      height: double.maxFinite,
      // color: pinkcolor,
        child: ListView(
          children:  [Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                dbox,
                 Row(children: [Container(width: 100,height: 100,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                 child:Image(fit: BoxFit.cover,
                  image: AssetImage('assets/full-length-cheerful-woman-denim-clothes-posing-white-wall.jpg')),),
                SizedBox(width: 20,),
                Column(children: [Text('Name Lastname',style: headingfont,),
                Text('fazilkdr@gmail.com',style: cardfont,),
                Text('+91 75648393',style: cardfont,)],)],
                ),
                dbox,
                const Divider(thickness: 2,),
                ProfileSettings(icon:Icons.location_on_outlined,text: 'Shipping Address',),
                dbox,
                ProfileSettings(icon: Icons.payment, text:'Payment Methods'),
                dbox,
                ProfileSettings(icon: Icons.heart_broken_outlined, text:'Wishlist'),
                dbox,
                ProfileSettings(icon: Icons.shopping_cart_checkout, text:'Orders'),
                dbox,
                ProfileSettings(icon: Icons.logout, text:'Logout')
              ],
            ),
          )],
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  final IconData icon;
  final String text;
  const ProfileSettings({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [Icon(icon),SizedBox(width: 25,),Text(text,style: cardfont,)],);
  }
}
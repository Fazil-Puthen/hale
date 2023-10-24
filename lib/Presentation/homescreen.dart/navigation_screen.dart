import 'package:flutter/material.dart';
import 'package:hale/Presentation/cartpage/cart_screen.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/widgets/drawer.dart';
import 'package:hale/Presentation/homescreen.dart/widgets/navigation_bar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex=0;
  @override
  Widget build(BuildContext context) {
    final screewidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: DrawerWidget(screewidth: screewidth, screenheight: screenheight),
        backgroundColor: Colors.white,
        bottomNavigationBar: NavigatioBarCurve(
          ontabtapped: (index) {
            setState(() {
              currentindex=index;
            });
          },
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                 SliverAppBar(
                  actions: [Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(heading[currentindex],style: cardfont,),
                  ),wbox,GestureDetector(onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CartPage()));
                  },
                    child: Icon(Icons.shopping_cart_outlined)),wbox],
           
                  // leading: Icon(Icons.menu),
                  title:  Image(height: 100,
                  width: 100,
                    image: AssetImage('assets/Hale.png')),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  expandedHeight: 15,
                )
              ];
            },
            body:navigationwidgets[currentindex] ),
          );
  }
}









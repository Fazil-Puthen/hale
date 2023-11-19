import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/cartpage/bloc/cart_bloc.dart';
import 'package:hale/Presentation/cartpage/cart_screen.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/home_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/homewidgetcontrol_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/drawer.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/navigation_bar.dart';


class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

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
            if(index==3){
              context.read<HomewidgetcontrolBloc>().add(Wishfetchevent());
            }
          context.read<HomeBloc>().add(Navigationwidgetchangeevent(index: index));
          },
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                 SliverAppBar(
                  actions: [InkWell(onTap: () {
                    print('cart fetch event calling');
                    print('this is user :$userid');
                      context.read<CartBloc>().add(Cartfetchevent(userid: userid));
                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CartPage()));
                  },
                   
                      child: const Icon(Icons.shopping_cart_outlined)),wbox],
           
                  // leading: Icon(Icons.menu),
                  title: const Image(height: 100,
                  width: 100,
                    image: AssetImage(hale)),
                  backgroundColor: Colors.transparent,
                  centerTitle: true,
                  expandedHeight: 15,
                )
              ];
            },
            body:BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state is Navigationchangestate){
                  print('this is the widget change ${state.index}');
                  // currentindex=state.index;
                return navigationwidgets[state.index];}
                 else{return navigationwidgets[0];}
              }
             
            )
          ));
  }
}









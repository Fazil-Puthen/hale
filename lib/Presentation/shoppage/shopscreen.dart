import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';
import 'package:hale/Presentation/shoppage/bloc/shoppage_bloc.dart';
import 'package:hale/Presentation/shoppage/refracted%20widgets/productgridview.dart';

class Shoppage extends StatelessWidget {
  final String category;
  const Shoppage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheigth = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category,
          style: detailfont(15, Colors.black, FontWeight.w300),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(
              hale,
              scale: 5,
            ),
          ),
        ],
      ),
      body: BlocBuilder<ShoppageBloc, ShoppageState>(
        // buildWhen: (previous, current) => current is CategorylistsuccessState,
        builder: (context, state) {
          if(state is Categoryloadingstate){
            return const Center(child: CircularProgressIndicator(),);
          }
          //success state
         else if (state is CategorylistsuccessState) {
            List<Productmodel> productlist = state.categorylist;
            return Container(
                width: screenwidth,
                height: double.infinity,
                color: pinkcolor,
                child: Productgridview(
                    productlist: productlist, screenheigth: screenheigth));
          } else if (state is CategorylistfailedState) {
            //failed state
            return const errorwidget(
              text: 'New Trends coming soon',
            );
          } else {
            return const Center(
              child: Text('No network'),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/bloc/detailpage_bloc.dart';

class Bottomcontainer extends StatelessWidget {
  final IconData icon;
  final Productmodel productdata;
  final Addto cartorlist;
  final Color color;
  const Bottomcontainer({
    super.key,
    required this.icon,
    required this.productdata,
    required this.cartorlist,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        context.read<DetailpageBloc>()
        .add(Addtocartevent(productdata: productdata, userid: userid,addto:cartorlist));
      },
      child: Container(
        width: 40,
        height: double.maxFinite,
        // decoration: const BoxDecoration(
        //   // color: Colors.white,
        //     // border: Border.all(),
        //     borderRadius: const BorderRadius.only(
        //         topLeft: Radius.circular(10),
        //         bottomRight: Radius.circular(10),
        //         bottomLeft: Radius.circular(10))),
        child: Center(
          child: Icon(icon,size: 25,color:color,),
        ),
      ),
    );
  }
}
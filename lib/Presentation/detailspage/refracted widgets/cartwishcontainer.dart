import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/bloc/detailpage_bloc.dart';

class bottomcontainer extends StatelessWidget {
  final Icon icon;
  final Productmodel productdata;
  final Addto cartorlist;
  const bottomcontainer({
    super.key,
    required this.icon,
    required this.productdata,
    required this.cartorlist,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('this is usermail $userid');
        context
            .read<DetailpageBloc>()
            .add(Addtocartevent(productdata: productdata, userid: userid,addto:cartorlist));
      },
      child: Container(
        width: 40,
        height: double.maxFinite,
        decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10))),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
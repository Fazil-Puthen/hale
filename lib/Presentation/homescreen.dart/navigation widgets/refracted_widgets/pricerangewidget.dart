import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/shoppage/bloc/shoppage_bloc.dart';
import 'package:hale/Presentation/shoppage/shopscreen.dart';
import 'package:hale/common_widgets/constants.dart';

class Pricerangewidget extends StatelessWidget {
  final String text;
  final int price;
  const Pricerangewidget({
    super.key,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ShoppageBloc>().add(Homecategoryselectedevent(selection: Seperate.price,
        price: price));
        Navigator.push(context,MaterialPageRoute(builder: (ctx)=>Shoppage(category: text)));
      },
      child: CircleAvatar(
        radius: 60,
        backgroundColor: Colors.white,
        child: Text(text, style:detailfont(17,Colors.red,FontWeight.bold)),
      ),
    );
  }
}
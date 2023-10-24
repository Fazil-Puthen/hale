import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class NavigatioBarCurve extends StatelessWidget {
  final  Function(int)? ontabtapped;

  const NavigatioBarCurve({
    super.key,
    required this.ontabtapped,
  });
  
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
        onTap:ontabtapped,
        height: 55,
        animationDuration: Duration(milliseconds: 200),
        animationCurve: Curves.ease,
        backgroundColor: Colors.white,
        color: Colors.transparent,
        buttonBackgroundColor: Colors.amber,
        items: const [
          Icon(Icons.home_outlined),
          Icon(Icons.category_outlined),
          Icon(Icons.shopping_bag_outlined),
          Icon(Icons.save_alt),
        ]);
  }
}
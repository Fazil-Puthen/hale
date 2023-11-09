import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class DrawerItems extends StatelessWidget {
  final Icon icon;
  final String label;
  const DrawerItems({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [icon,
      const SizedBox(width: 25,),
      Text(label,style: textfont,)],),
    );
  }
}
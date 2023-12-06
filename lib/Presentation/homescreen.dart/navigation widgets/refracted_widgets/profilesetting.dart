import 'package:flutter/material.dart';
import 'package:hale/common_widgets/constants.dart';

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
    return Row(children: [Icon(icon),const SizedBox(width: 25,),Text(text,style: cardfont,)],);
  }
}
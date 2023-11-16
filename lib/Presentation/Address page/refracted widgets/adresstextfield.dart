import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class Adresstextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const Adresstextfield({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText:hint,
    hintStyle: detailfont(10,Colors.black.withOpacity(0.6),
     FontWeight.normal,)),
     controller: controller,);
  }
}
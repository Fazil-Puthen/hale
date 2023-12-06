import 'package:flutter/material.dart';
import 'package:hale/common_widgets/constants.dart';

class Adresstextfield extends StatelessWidget {
  final String hint;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  const Adresstextfield({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboardType,
  });
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(decoration: InputDecoration(hintText:hint,
    hintStyle: detailfont(10,Colors.black.withOpacity(0.6),
     FontWeight.normal,)),
     controller: controller,
     validator: validator,
     keyboardType: keyboardType,);
  }
}
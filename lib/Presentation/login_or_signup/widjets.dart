import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';


 const  loginnbox = SizedBox(
    height: 10,
  );

class SimpleText extends StatelessWidget {
  final String text;
  const SimpleText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.abel(
              shadows: [const Shadow(offset: Offset(.2, .2))]));
  }
}

//text widget
class Textwidget extends StatelessWidget {
  final String text;
  final TextInputType keyboard;
  final TextEditingController control;
  String? Function(String?) validator;



 
   Textwidget({
    super.key,
    required this.text,
    required this.keyboard,
    required this.control,
     required this.validator,
    
  
  });
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Opacity(opacity: .7,
      child: TextFormField(
        validator: validator,
        keyboardType: keyboard,
        controller: control,
        decoration: InputDecoration(
          floatingLabelAlignment: FloatingLabelAlignment.center,
          labelText: text,
         
            labelStyle: GoogleFonts.abel(
                letterSpacing: 5,
                fontSize: 12,
                shadows: [const Shadow(offset: Offset(.2, .2))])),
      ),
    );
  }
}

//container button
class ContainerButton extends StatelessWidget {
  const ContainerButton({
    super.key,
    required this.screenwidth,
    required this.screenheight,
    required this.heading,
    required this.color,
    required this.onTap,
    // required this.size,
    // required this.colors,
    // required this.weight,
  });

  final double screenwidth;
  final double screenheight;
  final String heading;
  final Color color;
  // final double size;
  // final Color colors;
  // final FontWeight weight;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap:onTap ,
      child: Container(
        width: screenwidth,
        height: screenheight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color:color),
        child: Center(
          child: Text(heading,
          // style: detailfont(size, colors, FontWeight.w100),
          ),
        ),
      ),
    );
  }
}

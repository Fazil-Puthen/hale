import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/category_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/home_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/saved_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/shop_sliver_body.dart';


String userid='fazilkdr@gmail.com';
final cardfont=GoogleFonts.aBeeZee(fontSize: 14,fontWeight:FontWeight.w400,color: Colors.black);
final textfont=GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.black);
final errorfont=GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.normal,color: Colors.red);
final headingfont=GoogleFonts.aBeeZee(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black);
final pricefont=GoogleFonts.aBeeZee(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black);
const box=SizedBox(height: 8,);
const dbox=SizedBox(height: 15,);
const wbox= SizedBox(width: 15,);
final pinkcolor=Colors.pink.withOpacity(0.2);

const  boy='assets/boy.jpg';
const  girl='assets/girl.jpg';
const man='assets/man.jpg';
const sports='assets/sportswear.jpg';
const trek='assets/trek.jpg';
const woman='assets/woman.jpg';
const hale='assets/Hale.png';
const error='assets/9623052.png';

final List<String> category = ['Pants','Tshirt','Shirt','Trousers','Joggers',];
 List<Widget> navigationwidgets=[HomeWidget(),CategoryWidget(),ShopWidget(),WishWidget()];
const List<String> imagelist=[man,woman,boy,girl,sports,trek];
const List<String> taglist=['Men','Women','Boys','Girls','Sports','Trek'];
const List<String> heading=['Home','Category','Shop','Wishlist'];

//error snackbar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorsnackbar(String text,BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),   
  content: Row(children: [const Icon(Icons.error),Text(text,style: errorfont,)],),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.white,));
}

TextStyle detailfont(double size,Color color,FontWeight weight)
{
  return GoogleFonts.aBeeZee(fontSize: size,color:color,fontWeight: weight);
  
}


//error widget
class errorwidget extends StatelessWidget {
  final String text;
  const errorwidget({
    super.key,required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            error,
            scale: 4,
          ),
          box,
          Text(
            text,
            style: detailfont(20, Colors.red, FontWeight.w400),
          )
        ],
      ),
    );
  }
}

String validateName(String value) {
  final hasNumber = RegExp(r'\d').hasMatch(value); // '\d' matches any digit

  if (hasNumber) {
    return 'Name should not contain numbers';
  }
  return '';
}
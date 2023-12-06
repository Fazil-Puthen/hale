import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/category_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/home_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/saved_sliver_body.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/profile_sliver_body.dart';
import 'package:lottie/lottie.dart';


late String userid;
late String username;
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
 List<Widget> navigationwidgets=[const HomeWidget(),const CategoryWidget(),const ShopWidget(),const WishWidget()];
const List<String> imagelist=[man,woman,boy,girl,sports,trek];
const List<String> taglist=['Men','Women','Boys','Girls','Sports','Trek'];
const List<String> heading=['Home','Category','Shop','Wishlist'];



//error snackbar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> errorsnackbar(String text,BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1500),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),   
  content: Row(children: [const Icon(Icons.error),Text(text,style: errorfont,)],),
  behavior: SnackBarBehavior.floating,
  backgroundColor: Colors.white,));
}

TextStyle detailfont(double size,Color color,FontWeight weight)
{
  return GoogleFonts.aBeeZee(fontSize: size,color:color,fontWeight: weight);
  
}

//lottie loading widget
class Loadingwidget extends StatelessWidget {
  const Loadingwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(width: 200,
      height: 350,
        child: Lottie.asset('assets/animation/yellow.json',
        height: 50,
        width: 50,
        repeat: true,
        // reverse: true,
        fit: BoxFit.contain),
      ),
    );
  }
}

//loading state widget
class Loadingstatewidget extends StatelessWidget {
  final String text;
  const Loadingstatewidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return  Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [const CircularProgressIndicator(),Text(text,
    style: detailfont(15,Colors.black,FontWeight.w300),)],),);
  }
}


//error widget
class Errorwidget extends StatelessWidget {
  final String text;
  const Errorwidget({
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
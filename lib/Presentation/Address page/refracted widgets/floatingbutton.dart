import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/Address%20page/refracted%20widgets/adresstextfield.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';

class floatingbutton extends StatelessWidget {
  floatingbutton({
    super.key,
  });
  final housecontroller=TextEditingController();
  final placecontroller=TextEditingController();
  final pincontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: ()async{
      return showDialog(
        context:context,
        builder: (BuildContext ctx){
          return AdressAlertbox(housecontroller: housecontroller,
           placecontroller: placecontroller, 
           pincontroller: pincontroller,
           head: 'Add new adress',
           buttonhint: 'Add',
           adresscontrol: addordelete.add,);
        }
      );
    },
    child:Icon(Icons.add),backgroundColor: pinkcolor.withOpacity(0.5),);
  }
}


class AdressAlertbox extends StatelessWidget {
   AdressAlertbox({
    super.key,
    required this.housecontroller,
    required this.placecontroller,
    required this.pincontroller,
    required this.head,
    required this.buttonhint,
    required this.adresscontrol,
    this.index,
  });
  
  final String head;
  final String buttonhint;
  final TextEditingController housecontroller;
  final TextEditingController placecontroller;
  final TextEditingController pincontroller;
  final addordelete adresscontrol;
  int? index;
 

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(head,
      textAlign: TextAlign.center,
      style: detailfont(15,Colors.pink,FontWeight.w200),),
      content: SingleChildScrollView(
        child: Column(children: [
        Adresstextfield(controller: housecontroller,hint:'House Name',),
        box,
        Adresstextfield(controller: placecontroller,hint:'Place'),
        box,
        Adresstextfield(controller:pincontroller, hint:'Pincode'),
        box,
        // ElevatedButton.icon(onPressed: (){},
        //  icon:Icon(Icons.add), label:Text('Add',style: detailfont(15,Colors.pink,
        //   FontWeight.w200),))
        ContainerButton(screenwidth: 60,
         screenheight: 30,
          heading:buttonhint,
           color:pinkcolor, 
           onTap: (){
            context.read<AdressBloc>().add(AdressaddEvent(
              housename:housecontroller.text ,
             place: placecontroller.text,
              pincode: pincontroller.text,
              adresscontrol: adresscontrol,
              index: index));
              Navigator.of(context).pop();
           })
         ]),
      ) );
  }
}


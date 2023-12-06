import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/Address%20page/refracted%20widgets/adresstextfield.dart';
import 'package:hale/Presentation/chekoutpage/bloc/adresscheckout_bloc.dart';
import 'package:hale/Presentation/chekoutpage/bloc/checkout_bloc.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';

class Floatingbutton extends StatelessWidget {
  Floatingbutton({
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
           adresscontrol: Addordelete.add,);
        }
      );
    },
    backgroundColor: pinkcolor.withOpacity(0.5),
    child:const Icon(Icons.add));
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
  final Addordelete adresscontrol;
  final int? index;
 
  final formkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(head,
      textAlign: TextAlign.center,
      style: detailfont(15,Colors.pink,FontWeight.w200),),
      content: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(children: [
          Adresstextfield(controller: housecontroller,hint:'House Name',
          validator: (value) {
            if(value==null||value.isEmpty){
              return 'Mnadatory field';
            }
            else{
              return null;
            }
          },),
          box,
          Adresstextfield(controller: placecontroller,hint:'Place',
          validator: (value) {
            if(value==null||value.isEmpty){
              return 'Mnadatory field';
            }
             else{
              return null;
            }
          },),
          box,
          Adresstextfield(controller:pincontroller, hint:'Pincode',
          keyboardType: TextInputType.number,
          validator: (value) {
            if(value==null||value.isEmpty){
              return 'Mnadatory field';
            }
             else{
              return null;
            }
          },),
          box,
          ContainerButton(screenwidth: 60,
           screenheight: 30,
            heading:buttonhint,
             color:pinkcolor, 
             onTap: (){
              if(formkey.currentState!.validate()){
              context.read<AdressBloc>().add(AdressaddEvent(
                housename:housecontroller.text ,
               place: placecontroller.text,
                pincode: pincontroller.text,
                adresscontrol: adresscontrol,
                index: index));
                Navigator.of(context).pop();}
                 context.read<AdresscheckoutBloc>().add(AdressinitEvent(adressindex: 0));
                 context.read<CheckoutBloc>().add(CheckoutInitevent());
             })
           ]),
        ),
      ) );
  }
}


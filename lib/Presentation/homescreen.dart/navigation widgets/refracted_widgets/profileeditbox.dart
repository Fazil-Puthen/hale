import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/refracted%20widgets/adresstextfield.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/homewidgetcontrol_bloc.dart';
import 'package:hale/Presentation/login_or_signup/widjets.dart';
import 'package:hale/common_widgets/constants.dart';

class ProfileAlertbox extends StatelessWidget {
   ProfileAlertbox({
    super.key,
    required this.namecontroller,
    required this.phonecontroller,
    required this.head,
    required this.buttonhint,
    this.index,
  });
  
  final String head;
  final String buttonhint;
  final TextEditingController namecontroller;
  final TextEditingController phonecontroller;
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
          Adresstextfield(controller: namecontroller,hint:'Name',
          validator: (value) {
            if(value==null||value.isEmpty){
             return 'Name field cant be empty';
            }
            else{
              return null;
            }
          },),
          box,
          Adresstextfield(controller: phonecontroller,hint:'phone',
          keyboardType: TextInputType.number,
          validator: (value) {
            if(value==null||value.isEmpty){
             return 'Phone number cant be empty';
            }
            else if(value.length<10||value.length>10){
              return 'Phone number should be 10 digits';
            }
            else{
              return null;
            }}),
          // box,
          // Adresstextfield(controller:pincontroller, hint:'Pincode'),
          box,
          // ElevatedButton.icon(onPressed: (){},
          //  icon:Icon(Icons.add), label:Text('Add',style: detailfont(15,Colors.pink,
          //   FontWeight.w200),))
          ContainerButton(screenwidth: 60,
           screenheight: 30,
            heading:buttonhint,
             color:pinkcolor, 
             onTap: (){
              if(formkey.currentState!.validate()){
              context.read<HomewidgetcontrolBloc>().add(UpdateprofileEvent(name: namecontroller.text,
               phone:phonecontroller.text));
                Navigator.of(context).pop();
          }
          })
           ]),
        ),
      ) );
  }
}


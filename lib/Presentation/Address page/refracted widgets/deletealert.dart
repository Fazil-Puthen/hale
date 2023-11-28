import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class Deletealert extends StatelessWidget {
  final int index;
  const Deletealert({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(title: Text('Confirm Delete?',style: detailfont(15,Colors.black,FontWeight.w500),),
    content: Row(mainAxisAlignment: MainAxisAlignment.end,
      children: [
     TextButton(onPressed: (){Navigator.pop(context);},
     child:Text('Cancel',style: detailfont(13,Colors.blue,FontWeight.w300))),
     TextButton(onPressed: (){
       context.read<AdressBloc>().add(AdressdeleteEvent(index: index));
       Navigator.pop(context);},
      child:Text('Delete',style: detailfont(13,Colors.red,FontWeight.w300)))],),);
  }
}
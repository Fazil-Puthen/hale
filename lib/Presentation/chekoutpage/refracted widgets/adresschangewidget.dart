//adress change container
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/Address%20page/refracted%20widgets/floatingbutton.dart';
import 'package:hale/Presentation/chekoutpage/bloc/adresscheckout_bloc.dart';
import 'package:hale/Presentation/chekoutpage/refracted%20widgets/adressbottomsheet.dart';
import 'package:hale/common_widgets/constants.dart';

class AdressSelectcontainer extends StatelessWidget {
   AdressSelectcontainer({
    super.key,
    required this.screenwidth,
    required this.screenheight,

  });

  final double screenwidth;
  final double screenheight;
  final housecontroller=TextEditingController();
  final placecontroller=TextEditingController();
  final pincontroller=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenwidth * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: BlocBuilder<AdresscheckoutBloc, AdresscheckoutState>(
          builder: (context, state) {
            if (state is AdressloadingState) {
              return Center(
                child: SizedBox(child: Center(child: Text('Loading Adress....',
                style: detailfont(13,Colors.blue,FontWeight.w300),),),),
              );
            } 
            
            else if (state is AdressInitstate) {
              final adreslist = state.adreslist;
              if(adreslist.isNotEmpty){
              final index = state.adressindex;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Deliver to this Adress :',
                        style: detailfont(13, Colors.black, FontWeight.bold),
                      ),
                      Text(
                        '  ${adreslist[index].housename}',
                        style: detailfont(13, Colors.black, FontWeight.w300),
                      ),
                      Text(
                        '   ${adreslist[index].place}',
                        style: detailfont(11, Colors.black, FontWeight.w100),
                      ),
                      Text(
                        '   ${adreslist[index].pincode}',
                        style: detailfont(11, Colors.black, FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Adressbottomsheet(
                                    screenwidth: screenwidth,
                                    screenheight: screenheight,
                                    addreslist: adreslist,
                                    selectedindex: index,
                                  );
                                });
                          },
                          child: Text(
                            'Change',
                            style: detailfont(12, Colors.blue, FontWeight.w300),
                          ))
                    ],
                  )
                ],
              );}
              else{
                return SizedBox(child: Center(child:TextButton(onPressed: (){
                  showDialog(context: context,
                   builder:(BuildContext context){
                    return AdressAlertbox(
                    housecontroller: housecontroller, 
                    placecontroller: placecontroller, 
                    pincontroller: pincontroller, 
                    head: 'Add Adress', 
                    buttonhint:'Add', 
                    adresscontrol: Addordelete.add);
                   });
                  
                },
                child: const Text('Add Adress'),),),);
              }
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
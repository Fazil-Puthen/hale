import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/Address%20page/bloc/adress_bloc.dart';
import 'package:hale/Presentation/Address%20page/refracted%20widgets/floatingbutton.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class AdressPage extends StatelessWidget {
  const AdressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth=MediaQuery.of(context).size.width;
    final screeheight=MediaQuery.of(context).size.height;
    return  Scaffold(
      floatingActionButton: floatingbutton(),
      appBar:AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Image.asset(
              hale,
              scale: 6,
            ),
          ),
        ],
        title: Text(
          'Your Adress',
          style: cardfont,
        ),
        centerTitle: true,
      ),
      body: Container(
        width: screenwidth,
        color: pinkcolor,
        child: BlocBuilder<AdressBloc, AdressState>(
          builder: (context, state) {
            if(state is Adressloadingstate){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is AdressamangeState){
              final list=state.adresslist;
            return ListView.builder(itemCount: list.length,
              itemBuilder:(context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 0.5),
                     color: Colors.white,
                  ),
                width: screenwidth*0.7,
                height: screeheight*0.1,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text(list[index].housename,style: detailfont(15,Colors.black,FontWeight.w300),),
                  Text(list[index].place,style: detailfont(13,Colors.black,FontWeight.w200)),
                  Text(list[index].pincode,style: detailfont(10,Colors.black,FontWeight.bold))]),
                  Column(mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [Row(
                    children: [
                    GestureDetector(onTap: ()async {
                      return showDialog(context: context, builder:(context) {
                        TextEditingController housecontroller=TextEditingController();
                        TextEditingController placecontroller=TextEditingController();
                        TextEditingController pincontroller=TextEditingController();
                        housecontroller.text=list[index].housename;
                        placecontroller.text=list[index].place;
                        pincontroller.text=list[index].pincode;
                        return AdressAlertbox(
                          buttonhint: 'Update',
                          head: 'Update adress',
                          housecontroller:housecontroller ,
                          placecontroller: placecontroller,
                          pincontroller: pincontroller,
                          index: index,
                          adresscontrol: addordelete.update,);
                      },);
                    },
                      child: const Icon(Icons.edit,size: 20,color: Colors.brown,)),
                    wbox,
                    GestureDetector(onTap: () {
                      context.read<AdressBloc>().add(AdressdeleteEvent(index: index));
                    },
                      child: const Icon(Icons.delete_outline,size: 20,color: Colors.red,))],)],),],),
                ),),
              );
            },);}
            else{
              return const Center(child: Text('No adress added'),);
            }
          },
        ),
      ),

    );
  }
}


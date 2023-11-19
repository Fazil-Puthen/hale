import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/home_bloc.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/homewidgetcontrol_bloc.dart';

class WishWidget extends StatelessWidget {
  const WishWidget({super.key});

  @override
  Widget build(BuildContext context) {
     final screenwidth=MediaQuery.of(context).size.width;
    final screenheight=MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth*0.8,
      height: double.maxFinite,
      color: pinkcolor,
      child:StreamBuilder(stream: FirebaseFirestore.instance.collection('users').doc(userid)
      .collection('wishlist').snapshots(),
      builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Loadingstatewidget(text: 'Fetching wishlist');
        }
        else if(snapshot.hasData){
          if(snapshot.data!.docs.isNotEmpty){
             return ListView.separated(itemBuilder:(context, index) {
              final value=snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (ctx)=>DetailsScreen(productdata: 
                      Productmodel(brand: value['brand'], 
                      name: value['name'], 
                      category: value['category'], 
                      description: value['description'],
                       price: value['price'], 
                       quantitiy:value['quantity'],
                        imageurl: value['imageurl']))));
                    },
                    child: ListTile(
                      tileColor: Colors.white,
                      leading: Image(image: NetworkImage(value['imageurl'][0])),
                      title: Text(value['name'],style: cardfont,),
                      subtitle: Text('₹ ${value['price']}',style:detailfont(10,
                      Colors.red,FontWeight.w200),),
                      trailing: TextButton(onPressed: (){
                      context.read<HomewidgetcontrolBloc>().add(WishdeleteEvent(id: value['name']));
                      },
                      child: Text('Remove',
                      style: detailfont(10,Colors.blue,FontWeight.normal),),)
                    ),
                  ),
                ),
              );
            },
             separatorBuilder:(context,index)=>box,
              itemCount: snapshot.data!.docs.length);
        }
        else{
          return const Center(child: Text('no data'),);
        }

          }
          else{
            return const Center(child: Text('nothing'),);
          }
        }));
      }
      // builder: builder),BlocBuilder<HomewidgetcontrolBloc, HomewidgetcontrolState>(
      //   builder: (context, state) {
      //     if(state is wishLoadingstate){
      //       return const Loadingstatewidget(text: 'Fetching wishlist',);
      //     }
      //     else if(state is WishlistEmptystate){
      //       return const Center(child: Text('Nothing in wishlist'),);
      //     }
      //     else if(state is Wishsuccessstate){
      //       final List<Productmodel> wish=state.wishlist;
      //     return ListView.separated(itemBuilder:(context, index) {
      //         return Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 15),
      //           child: Container(decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(15)
      //           ),
      //             child: InkWell(
      //               onTap: () {
      //                 Navigator.push(context,
      //                 MaterialPageRoute(builder: (ctx)=>DetailsScreen(productdata: wish[index])));
      //               },
      //               child: ListTile(
      //                 tileColor: Colors.white,
      //                 leading: Image(image: NetworkImage(wish[index].imageurl[0])),
      //                 title: Text(wish[index].name,style: cardfont,),
      //                 subtitle: Text('₹ ${wish[index].price.toString()}',style:detailfont(10,
      //                 Colors.red,FontWeight.w200),),
      //                 trailing: TextButton(onPressed: (){

      //                 },
      //                 child: Text('Remove',
      //                 style: detailfont(10,Colors.blue,FontWeight.normal),),)
      //               ),
      //             ),
      //           ),
      //         );
      //       },
      //        separatorBuilder:(context,index)=>box,
      //         itemCount: wish.length);
      //   }
      //   else{
      //     return Center(child: Text('nothing'));
      //   }},
      // ) ,
}
//     );
//   }
// }


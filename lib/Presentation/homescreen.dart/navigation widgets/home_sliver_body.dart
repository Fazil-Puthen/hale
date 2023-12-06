import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/homescreen.dart/navigation%20widgets/refracted_widgets/pricerangewidget.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';
import 'package:hale/Presentation/shoppage/bloc/shoppage_bloc.dart';
import 'package:hale/Presentation/shoppage/shopscreen.dart';
import 'package:lottie/lottie.dart';


class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: pinkcolor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Hot Deals',
                  style: cardfont,
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 250,
                child: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('products')
                        .snapshots(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return  Center(
                  child: SizedBox(width: 50,
                  height: 50,
                    child: Lottie.asset('assets/animation/yellow.json',
                    height: 50,
                    width: 50,
                    repeat: true,
                    // reverse: true,
                    fit: BoxFit.contain),
                  ),
                );
                      }
                      else if(snapshot.connectionState==ConnectionState.done){
                        return const Center(child: Text('Bad network connection'),);
                      }
        
                     else if (snapshot.hasData) {
                        return ListView.separated(
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final value=snapshot.data.docs[index];
                            return InkWell(
                              onTap: () {
                                // String docid=value.id;
                                final product=Productmodel(
                                brand: value['Brand'],
                                name: value['Name'],
                                category: value['category'], 
                                description: value['description'],
                                price: value['price'], 
                                quantitiy: value['quantity'],
                                imageurl: value['imageurl']);
                                // context.read<DetailpageBloc>().add(DetailedviewEvent(docid: docid));
                                Navigator.of(context).push(MaterialPageRoute(builder:
                                 (ctx)=>DetailsScreen(productdata: product,)));
                              },
                                child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: SizedBox(
                                      width: 120,
                                      // height: 200,
                                      child:Image.network(value['imageurl'][0]),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value['Name'],
                                        style: detailfont(
                                            12, Colors.black, FontWeight.normal),
                                      ),
                                      Text(
                                        '₹ ${value['price']}',
                                        style: detailfont(
                                            10, Colors.black, FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ));
                          },
                          separatorBuilder: (context, index) => const Divider(
                            color: Colors.red,
                            height: 2,
                            thickness: 2,
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ),
              box,
              SizedBox(
                width: double.infinity,
                height: 30,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return OutlinedButton(
                        onPressed: () {
                         String categoryitem=category[index];
                         context.read<ShoppageBloc>().add(Homecategoryselectedevent(category: categoryitem,
                         selection: Seperate.item));
                         Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Shoppage(category: categoryitem,)));
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white.withOpacity(1))),
                        child: Text(
                          category[index],
                          style: textfont,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                    itemCount: category.length),
              ),
              box,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Pricerangewidget(
                    text: 'Under ₹399',
                    price: 399,
                  ),
                  Pricerangewidget(
                    text: 'Under ₹299',
                    price: 299,
                  )
                ],
              ),
              box,
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'New Arrivals',
                  style: cardfont,
                ),
              ),
              box,
              // SizedBox(
              //   width: double.infinity,
              //   height: 150,
              //   child: ListView.separated(
              //     itemCount: imagelist.length,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (context, index) {
              //       return GestureDetector(
              //           child: Card(
              //         child: Container(
              //           width: 100,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: Colors.transparent,
              //               image: DecorationImage(
              //                   fit: BoxFit.fill,
              //                   image: AssetImage(
              //                     imagelist[index],
              //                   ))),
              //         ),
              //       ));
              //     },
              //     separatorBuilder: (context, index) => const Divider(
              //       color: Colors.red,
              //       height: 2,
              //       thickness: 2,
              //     ),
              //   ),
              // ),

              StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('products')
                      .snapshots(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return  Center(
                child: SizedBox(width: 50,
                height: 50,
                  child: Lottie.asset('assets/animation/yellow.json',
                  height: 50,
                  width: 50,
                  repeat: true,
                  // reverse: true,
                  fit: BoxFit.contain),
                ),
              );
                    }
                    else if(snapshot.connectionState==ConnectionState.done){
                      return const Center(child: Text('Bad network connection'),);
                    }
                  
                   else if (snapshot.hasData) {
                      return SizedBox(
                        width: double.infinity,
                        height:500,
                        child: GridView.builder(
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 10
                          ),
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final value=snapshot.data.docs[index];
                            return InkWell(
                              onTap: () {
                                // String docid=value.id;
                                final product=Productmodel(
                                brand: value['Brand'],
                                name: value['Name'],
                                category: value['category'], 
                                description: value['description'],
                                price: value['price'], 
                                quantitiy: value['quantity'],
                                imageurl: value['imageurl']);
                                // context.read<DetailpageBloc>().add(DetailedviewEvent(docid: docid));
                                Navigator.of(context).push(MaterialPageRoute(builder:
                                 (ctx)=>DetailsScreen(productdata: product,)));
                              },
                                child: Container(
                                  decoration:BoxDecoration(
                                    // border: Border.all(width: 0.05),
                                    // color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)
                                  ),
                                  width: 100,
                                  height: 300,
                                  child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: SizedBox(
                                        width: 100,
                                        height: 120,
                                        child: Image.network(value['imageurl'][0]),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value['Name'],
                                          style: detailfont(
                                              12, Colors.black, FontWeight.normal),
                                        ),
                                        Text(
                                          '₹ ${value['price']}',
                                          style: detailfont(
                                              10, Colors.black, FontWeight.normal),
                                        ),
                                      ],
                                    ),
                                  ],
                                  ),
                                ));
                          }),
                      );
                       } else {
                      return Container();
                    }
                  }),


            ],
          ),
        ),
      ),
    );
  }
}



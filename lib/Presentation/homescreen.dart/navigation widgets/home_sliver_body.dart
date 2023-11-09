import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';
import 'package:hale/Presentation/homescreen.dart/bloc/home_bloc.dart';


class HomeWidget extends StatefulWidget {
  AsyncSnapshot<dynamic>? snapshot;
  HomeWidget({super.key, this.snapshot});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
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
                        print('waiting for connection');
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if(snapshot.connectionState==ConnectionState.none){
                        print('connection state none');
                        return const Center(child: Text('Bad network connection'),);
                      }
        
                     else if (snapshot.hasData) {
                      print('No data availabale');
                        return ListView.separated(
                          itemCount: snapshot.data.docs.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final value=snapshot.data.docs[index];
                            return InkWell(
                              onTap: () {
                                String docid=value.id;
                                // context.read<DetailpageBloc>().add(DetailedviewEvent(docid: docid));
                                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DetailsScreen(productdata: value,)));
                              },
                                child: Card(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Container(
                                      width: 120,
                                      // height: 200,
                                      child: Image.network(value['imageurl'][0]),
                                      // decoration: BoxDecoration(
                                      //     borderRadius: BorderRadius.circular(10),
                                      //     color: Colors.transparent,
                                      //     image:  DecorationImage(
                                      //         fit: BoxFit.fill,
                                      //         image:NetworkImage(
                                      //           snapshot.data.docs[index]['imageurl'][0],
                                      //         ))),
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
                         context.read<HomeBloc>().add(Navigationwidgetchangeevent(index: 2,category: categoryitem));
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
              // SizedBox(
              //   width: screenwidth * 0.9,
              //   height: double.maxFinite,
              //   child:
              //          GridView.builder(itemCount: 10,
              //           gridDelegate:
              //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              //         crossAxisSpacing: 10,
              //         mainAxisExtent: double.maxFinite,
              //         mainAxisSpacing: 10),
              //         itemBuilder:(context, index) {
              //           return Card(
              //             child: Container(width: screenwidth*0.4,
              //             height: 100,
              //             color: (index%2==0)?Colors.yellow:Colors.red,),
              //           );
        
              //         }
        
              // )),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Pricerangewidget(
                    text: 'Under ₹399',
                  ),
                  Pricerangewidget(
                    text: 'Under ₹399',
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
              SizedBox(
                width: double.infinity,
                height: 150,
                child: ListView.separated(
                  itemCount: imagelist.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        child: Card(
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  imagelist[index],
                                ))),
                      ),
                    ));
                  },
                  separatorBuilder: (context, index) => const Divider(
                    color: Colors.red,
                    height: 2,
                    thickness: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Pricerangewidget extends StatelessWidget {
  final String text;
  const Pricerangewidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: Colors.white,
      child: Text(text, style: pricefont),
    );
  }
}
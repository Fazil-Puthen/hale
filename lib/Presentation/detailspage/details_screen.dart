import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/common_widgets/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hale/Presentation/detailspage/bloc/detailpage_bloc.dart';
import 'package:hale/Presentation/detailspage/refracted%20widgets/cartwishcontainer.dart';

class DetailsScreen extends StatefulWidget {
  final Productmodel productdata;
  const DetailsScreen({super.key, required this.productdata});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    context.read<DetailpageBloc>().add(Addtocartevent(
        productdata: widget.productdata,
        userid: userid,
        addto: Addto.initialcheck));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final List<dynamic> imagelist = widget.productdata.imageurl;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        elevation: 0,
        title: Text(
          widget.productdata.category.toString(),
          style: cardfont,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.asset(hale),
          )
        ],
      ),
      body: Container(
        width: screenwidth,
        height: double.maxFinite,
        color: pinkcolor,
        child: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  autoPlayCurve: Curves.easeIn,
                  aspectRatio: 1.7 / 2,
                ),
                items: imagelist
                    .map((item) => Container(
                        color: Colors.white,
                        child: Image.network(
                          item,
                        )))
                    .toList()),
            box,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.productdata.name,
                    style: headingfont,
                  ),
                  box,
                  Text(
                    'Rs.${widget.productdata.price} only/-',
                    style: detailfont(15, Colors.red, FontWeight.w200),
                  ),
                  box,
                  Wrap(children: [
                    Text(
                      widget.productdata.description,
                      style: textfont,
                    )
                  ]),
                  box,
                  dbox,
                  // Text(
                  //   'colors',
                  //   style: headingfont,
                  // ),
                  // const Row(
                  //   children: [
                  //     CircleAvatar(
                  //       backgroundColor: Colors.red,
                  //     ),
                  //     wbox,
                  //     CircleAvatar(
                  //       backgroundColor: Colors.yellow,
                  //     ),
                  //     wbox,
                  //     CircleAvatar(
                  //       backgroundColor: Colors.black,
                  //     )
                  //   ],
                  // ),
                  // dbox,
                  // Text(
                  //   'size',
                  //   style: headingfont,
                  // ),
                  // const Row(
                  //   children: [
                  //     Text('X'),
                  //     wbox,
                  //     Text('XS'),
                  //     wbox,
                  //     Text('S'),
                  //     wbox,
                  //     Text('L')
                  //   ],
                  // ),
                  dbox,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.pink.withOpacity(0.1),
        // shape: CircularNotchedRectangle(),
        // notchMargin: 5,
        height: screenheight * 0.1,
        // clipBehavior: Clip.none,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                BlocConsumer<DetailpageBloc, DetailpageState>(
                  listener: (context, state){
                    if(state is Buttonclickedstate&&state.snackbar==true){
                      errorsnackbar(state.snaktext!, context);
                    }
                  },
                  builder: (context, state) {
                    if (state is Buttonclickedstate) {
                      return Bottomcontainer(
                        icon: Icons.favorite,
                        productdata: widget.productdata,
                        cartorlist: Addto.wishlist,
                        color: state.wishclicked! ? Colors.red : Colors.white,
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            BlocBuilder<DetailpageBloc, DetailpageState>(
                  builder: (context, state) {
                   if(state is Buttonclickedstate){
                    return 
                    // Bottomcontainer(
                    //   icon: Icons.shopping_bag_outlined,
                    //   productdata: widget.productdata,
                    //   cartorlist: Addto.cart,
                    //   color:state.cartclicked!? Colors.red:Colors.white,
                    // )
                    OutlinedButton(onPressed: (){
                       context.read<DetailpageBloc>()
        .add(Addtocartevent(productdata: widget.productdata, userid: userid,addto:Addto.cart));
                    }, child:state.cartclicked!?Text('In Cart',style: detailfont(12,Colors.red,
                     FontWeight.w300)):Text('Add to Cart',style: detailfont(12,Colors.white,
                     FontWeight.w300),));
                    }
                    else{
                      return Container();
                    }
                  },
                ),
          ],
        ),
      ),
    );
  }
}

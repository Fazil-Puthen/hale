import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailsScreen extends StatelessWidget {
  final dynamic productdata;
  DetailsScreen({super.key, required this.productdata});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    final List<dynamic> imagelist = productdata['imageurl'];
    print('the length ${imagelist.length}');
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 10,
        elevation: 0,
        // leading: Image.asset(hale),
        title: Text(
          productdata['category'].toString(),
          style: cardfont,
        ),
        centerTitle: true,
        actions: [Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(hale),
        )],
      ),
      body: Container(
        width: screenwidth,
        height: double.maxFinite,
        color: pinkcolor,
        child: ListView(
          children: [
            CarouselSlider(
                options: CarouselOptions(
                  // autoPlay: true,
                  // autoPlayAnimationDuration: Duration(seconds: 10),
                  // height: screenwidth*0.6,
                  autoPlayCurve: Curves.easeIn,
                  aspectRatio: 1.7 / 2,
                ),
                items: imagelist
                    .map((item) => Container(
                        // width: screenwidth,
                        // height: screenheight,
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
                    productdata['Name'],
                    style: headingfont,
                  ),
                  box,
                  Text(
                    'Rs.${productdata['price']} only/-',
                    style: detailfont(15, Colors.red, FontWeight.w200),
                  ),
                  box,
                  Wrap(children: [
                    Text(
                      productdata['description'],
                      style: textfont,
                    )
                  ]),
                  box,
                  dbox,
                  Text(
                    'colors',
                    style: headingfont,
                  ),
                  const Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                      ),
                      wbox,
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                      ),
                      wbox,
                      CircleAvatar(
                        backgroundColor: Colors.black,
                      )
                    ],
                  ),
                  dbox,
                  Text(
                    'size',
                    style: headingfont,
                  ),
                  const Row(
                    children: [
                      Text('X'),
                      wbox,
                      Text('XS'),
                      wbox,
                      Text('S'),
                      wbox,
                      Text('L')
                    ],
                  ),
                  dbox,
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color:pinkcolor,
        // shape: CircularNotchedRectangle(),
        // notchMargin: 5,
        height: screenheight * 0.1,
        clipBehavior: Clip.none,
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              children: [
                bottomcontainer(icon: Icon(Icons.shopping_bag_outlined,size: 20,),),
                SizedBox(width: 15,),
                bottomcontainer(icon: Icon(Icons.shopping_cart_outlined,size: 20,)),
              ],
            ),
            OutlinedButton(onPressed: () {}, child: const Text('Buy Now'))
          ],
        ),
      ),
    );
  }
}

class bottomcontainer extends StatelessWidget {
  final Icon icon;
  const bottomcontainer({
    super.key,required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: double.maxFinite,
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10))
              ),
              child: Center(child: icon,),
    );
  }
}

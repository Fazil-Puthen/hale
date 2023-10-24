import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class HomeWidget extends StatelessWidget {
 const  HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(color:pinkcolor,
      child: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 150,
              child: ListView.separated(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      child: Card(
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'assets/full-length-cheerful-woman-denim-clothes-posing-white-wall.jpg',
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
            box,
            SizedBox(
              width: double.infinity,
              height: 25,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber.withOpacity(0.1)),
                      child: Center(
                        child: Text(
                          category[index],
                          style: textfont,
                        ),
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Pricerangewidget(text: 'Under ₹399',),
            Pricerangewidget(text: 'Under ₹399',)
            ],),
            box,
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text('New Arrivals',style: cardfont,),
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
                          image:  DecorationImage(
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
    return CircleAvatar(radius: 60,
    backgroundColor: Colors.black.withOpacity(0.5),child: Text(text,style:pricefont),);
  }
}

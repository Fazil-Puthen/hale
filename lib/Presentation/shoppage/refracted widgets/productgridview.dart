import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';
import 'package:hale/Presentation/detailspage/details_screen.dart';

class Productgridview extends StatelessWidget {
  const Productgridview({
    super.key,
    required this.productlist,
    required this.screenheigth,
  });

  final List<Productmodel> productlist;
  final double screenheigth;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: productlist.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // childAspectRatio: .7,
          crossAxisCount: 2,
          mainAxisExtent: screenheigth * 0.45,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10),
      itemBuilder: (context, index) {
        final firstimage = productlist[index].imageurl[0];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => DetailsScreen(
                          productdata: productlist[index],
                        )));
              },
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(firstimage),
                        fit: BoxFit.contain,
                      )),
                  Text(
                    productlist[index].name,
                    style: cardfont,
                  ),
                  Text(
                    productlist[index].brand,
                    style: textfont,
                  ),
                  Text(
                    '₹ ${productlist[index].price.toString()}',
                    style: textfont,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hale/Models/productmodel.dart';
import 'package:hale/common_widgets/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GridView.builder(
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
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => DetailsScreen(
                          productdata: productlist[index],
                        )));
              },
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image(
                        image: NetworkImage(firstimage),
                        fit: BoxFit.contain,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productlist[index].name,
                          style: detailfont(14,Colors.black,FontWeight.w600),
                        ),
                        Text(
                          productlist[index].brand,
                          style: detailfont(12,Colors.black,FontWeight.normal),
                        ),
                        Text(
                          '₹ ${productlist[index].price.toString()}',
                          style: detailfont(12,Colors.red,FontWeight.w300),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:hale/Presentation/common_widgets/constants.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Container(
      width: screenwidth*0.8,
      height: double.maxFinite,
      color: pinkcolor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.separated(
              itemCount: imagelist.length,
              itemBuilder: (context, index) {
                return ExpansionTile(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  leading: Icon(Icons.list,size: 15,),
                  collapsedShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  collapsedBackgroundColor:Colors.black.withOpacity(0.1),
                  backgroundColor: Colors.white,
                  title: Text(taglist[index],style: cardfont,),
                  children:[ ListTile(
                    titleTextStyle: headingfont,
                    subtitleTextStyle: textfont,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    leading: ClipRRect(
                        child: Container(
                      width: screenwidth * 0.15,
                      height: 300,
                      child: Image(
                          fit: BoxFit.fill, image: AssetImage(imagelist[index])),
                    )),
                    title: Text(taglist[index]),
                    subtitle: const Text(
                        'For a scenario like this where you have different sections, consider using a '),
                  ),
                ]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
            ),
          
      ),
    );
  }
}

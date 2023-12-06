import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hale/Models/adressmodel.dart';
import 'package:hale/Presentation/chekoutpage/bloc/adresscheckout_bloc.dart';
import 'package:hale/common_widgets/constants.dart';

class Adressbottomsheet extends StatefulWidget {
  const Adressbottomsheet({
    super.key,
    required this.screenwidth,
    required this.screenheight,
    required this.addreslist,
    required this.selectedindex,
  });

  final double screenwidth;
  final double screenheight;
  final List<Adressmodel> addreslist;
  final int selectedindex;

  @override
  State<Adressbottomsheet> createState() => _AdressbottomsheetState();
}

class _AdressbottomsheetState extends State<Adressbottomsheet> {
  @override
  Widget build(BuildContext context) {
    int selectedvalue = widget.selectedindex;
    return Container(
      width: widget.screenwidth,
      height: widget.screenheight * 0.6,
      color: pinkcolor,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.screenwidth * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: RadioListTile(
                  activeColor: Colors.yellow,
                  title: Text(widget.addreslist[index].housename,
                  style: detailfont(13,Colors.black,FontWeight.w400),),
                  subtitle: Text(widget.addreslist[index].place,
                  style: detailfont(10,Colors.black,FontWeight.w200),),
                  value: index,
                  groupValue: selectedvalue,
                  onChanged: (value) {
                    context.read<AdresscheckoutBloc>().add(AdressinitEvent(adressindex: value??0));
                    setState(() {
                      selectedvalue = value ?? 0;
                    });
                    Navigator.pop(context);
                    
                  },
                ),
              ),
            ),
          );
        },
        // separatorBuilder: (context, index) => const Divider(),
        itemCount: widget.addreslist.length,
      ),
    );
  }
}
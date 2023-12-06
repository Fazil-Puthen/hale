import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  const ContainerCard({
    super.key,
    required this.screenwidth,
    required this.screenheight,
    required this.childofcontainer,
  });

  final double screenwidth;
  final double screenheight;
  final Widget childofcontainer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
            width: screenwidth * 0.8,
            height: screenheight * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: Colors.white54, offset: Offset(3, 6))],
        gradient: LinearGradient(colors: [
          Colors.yellow.shade50,
          Colors.yellow.shade100,
        ])),
        child: childofcontainer,
          ),
    );
  }
}

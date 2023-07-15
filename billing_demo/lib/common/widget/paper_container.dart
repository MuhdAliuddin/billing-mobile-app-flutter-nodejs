import 'package:flutter/material.dart';

class PaperContainer extends StatelessWidget {
  const PaperContainer({required this.widget, required this.height, super.key});

  final Widget widget;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height, //WAS 500
      width: 450,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: const Border(
          top: BorderSide(width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
          left: BorderSide(width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
          right: BorderSide(width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
          bottom: BorderSide(width: 1.0, color: Color.fromARGB(255, 194, 194, 194)),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(
              0.0,
              0.0,
            ),
            blurRadius: 5.0,
            spreadRadius: 2.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: widget,
    );
  }
}

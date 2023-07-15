import 'package:flutter/material.dart';

class TaskContainer extends StatelessWidget {
  const TaskContainer({required this.widget, required this.height, super.key});

  final Widget widget;
  final double height;

  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Container(
      height: height, //was height:90
      width: 400,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
          ), //BoxShadow
        ],
      ),
      child: widget,
    );
  }
}

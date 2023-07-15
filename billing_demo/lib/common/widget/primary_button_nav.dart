import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  PrimaryButton({required this.title, required this.className, super.key});

  final String title;
  Widget Function() className;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ElevatedButton(
      style: buttonStyle,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return className();
        }));
      },
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    ));
  }
}

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 20),
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
);

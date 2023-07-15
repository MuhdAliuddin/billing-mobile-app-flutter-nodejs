import 'package:flutter/material.dart';

class IconBtnGrey extends StatelessWidget {
  const IconBtnGrey({required this.title, super.key});
  final String title;
  @override
  Widget build(BuildContext context) {
    // Material is a conceptual piece
    // of paper on which the UI appears.
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(right: 40),
      child: TextButton.icon(
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.grey,
          size: 30.0,
        ),
        label: Text(
          title,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        onPressed: () {
          // print('Kembali');
        },
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ));
  }
}

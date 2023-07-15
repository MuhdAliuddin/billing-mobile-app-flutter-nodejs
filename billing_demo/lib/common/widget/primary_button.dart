import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.title,
    required this.onPress,
    super.key,
  });

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: ElevatedButton(
      style: buttonStyle,
      onPressed: () => onPress(),
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

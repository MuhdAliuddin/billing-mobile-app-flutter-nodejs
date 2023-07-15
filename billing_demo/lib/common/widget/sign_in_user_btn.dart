import 'package:flutter/material.dart';

class SignInUserBtn extends StatelessWidget {
  const SignInUserBtn({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: () {
          onPressed();
        },
        child: const Text(
          "Log Masuk",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 20),
  minimumSize: const Size.fromHeight(40),
  // shape: RoundedRectangleBorder(
  //   borderRadius: BorderRadius.circular(25),
  // ),
);

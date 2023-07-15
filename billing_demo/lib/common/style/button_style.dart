import 'package:flutter/material.dart';

ButtonStyle buttonStyle = ElevatedButton.styleFrom(
  textStyle: const TextStyle(fontSize: 20),
  minimumSize: const Size.fromHeight(40),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(25),
  ),
);

ButtonStyle elevatedButtonStyleFont20 = ElevatedButton.styleFrom(
  textStyle: const TextStyle(
    fontSize: 20,
  ),
);

import 'package:flutter/material.dart';

ScaffoldFeatureController errorSnackbar(
  BuildContext context,
  String text,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}

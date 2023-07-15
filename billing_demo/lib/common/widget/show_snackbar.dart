import 'package:flutter/material.dart';

void showErrorSnackbar(
  BuildContext context,
  String? error,
) {
  final SnackBar snackBar;

  if (error != null) {
    snackBar = _buildSnackBar(error, Colors.red[200]);
  } else {
    snackBar = _buildSnackBar("Maaf, operasi tidak dapat dilaksanakan", Colors.red[200]);
  }

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

void showSuccessSnackbar(
  BuildContext context,
  String? message,
) {
  final SnackBar snackBar;

  if (message != null) {
    snackBar = _buildSnackBar(message, Colors.green[200]);
  } else {
    snackBar = _buildSnackBar("Operasi berjaya dilaksanakan", Colors.green[200]);
  }

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

SnackBar _buildSnackBar(String message, Color? color) {
  return SnackBar(
    duration: const Duration(milliseconds: 800),
    content: Text(
      message,
      textAlign: TextAlign.center,
    ),
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// void showSnackbarMessage(
//     BuildContext context, String message, Color? backgroundColor) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 2),
//       backgroundColor: backgroundColor,
//       content: Text(message),
//     ),
//   );
// }

void showToastMessage(String message, Color backgroundColor) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: backgroundColor,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

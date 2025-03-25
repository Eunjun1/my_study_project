import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// 실패

snackbarFunction(
  BuildContext context,
  String message,
  Color colors,
  int seconds,
) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.black)),
      backgroundColor: colors,
      duration: Duration(seconds: seconds),
    ),
  );
}

toastFunction(
  String msg,
  ToastGravity gravity,
  double fontsized,
  Color colors,
  Toast toastlength,
) {
  Fluttertoast.showToast(
    msg: msg,
    gravity: gravity,
    fontSize: fontsized,
    textColor: colors,
    toastLength: toastlength,
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Color hexStringToColor(String hex) {
  return Color(
    int.parse(
      hex.replaceAll("#", "0xff"),
    ),
  );
}

void showError(String msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

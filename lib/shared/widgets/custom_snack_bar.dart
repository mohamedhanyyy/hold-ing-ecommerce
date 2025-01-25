 import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class CustomSnackBars {
  static void showSuccessToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
       backgroundColor: Colors.green,
       fontSize: 16,
    );
  }

  static void showErrorToast({required String title, Toast? length}) {
    Fluttertoast.showToast(
      msg: title,
      toastLength: length ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
       backgroundColor: Colors.red,
       fontSize: 16,
    );
  }
}

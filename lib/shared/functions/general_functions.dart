
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralFunctions {

  static void hideKeyboard() {
    if (FocusManager.instance.primaryFocus?.hasFocus == true) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static void setPreferredOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

}

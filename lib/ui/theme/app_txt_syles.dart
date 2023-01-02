import 'package:flutter/material.dart';

import '../../utils.dart';

class AppTxtStyles{
  static getAppMainTxtStyle(
      {required double size, required FontWeight fontWeight}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: Colors.black,
      fontFamily: Utils.chivoMonoFont,
    );
  }
  static getAppMainTxtStyleWhiteColor(
      {required double size, required FontWeight fontWeight}) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: Colors.white,
      fontFamily: Utils.chivoMonoFont,
    );
  }
}
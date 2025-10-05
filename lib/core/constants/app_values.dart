import 'package:flutter/material.dart';

class AppValues {
  AppValues._();
  static const String poppinsFont = 'poppins';
  static double fullWidget(context) => MediaQuery.of(context).size.width;
  static double fullHeight(context) => MediaQuery.of(context).size.height;
}

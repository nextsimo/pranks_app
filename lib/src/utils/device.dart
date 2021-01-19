import 'package:flutter/material.dart';

class Device {
  static BuildContext gContext;
  static double width;
  static double height;
  static Size size;

  Device.init(BuildContext context) {
    gContext = context;
    size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';

class AdsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: 63,
      width: Device.width,
      color: Colors.white,
      child: Center(
        child: Text(
          "Ads",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}

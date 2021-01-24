import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final double height;

  const CustomDivider({Key key, this.height = 2.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
    );
  }
}

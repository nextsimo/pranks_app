import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Color color;

  const WhiteContainer({Key key, this.color = Colors.white}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      height: 72,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
          child: Text(
            "Banner server",
            style: TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

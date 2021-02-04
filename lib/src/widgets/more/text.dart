import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  final String text;
  final Color colore;

  const WidgetText({Key key, this.text, this.colore = const Color(0xFFAAABAF)})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: colore),
    );
  }
}

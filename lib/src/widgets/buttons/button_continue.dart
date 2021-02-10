import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';

class ButtonContinue extends StatefulWidget {
  final Color color;
  final Widget page;

  const ButtonContinue({Key key, this.color = Colors.white, this.page})
      : super(key: key);

  @override
  _ButtonContinueState createState() => _ButtonContinueState();
}

class _ButtonContinueState extends State<ButtonContinue> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          navigateTo(context, widget.page);
          selected = !selected;
        });
      },
      child: Column(
        children: [
          Container(
            width: Device.width * 0.6,
            height: 61,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: selected ? Color(0xffFFCE00) : Colors.white,
            ),
            child: Center(
              child: Text(
                "CONTNUE",
                style: TextStyle(
                  color: Color(0xff313036),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

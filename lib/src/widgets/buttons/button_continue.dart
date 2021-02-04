import 'package:flutter/material.dart';

class ButtonContinue extends StatefulWidget {
  final Color color;

  const ButtonContinue({Key key, this.color = Colors.white}) : super(key: key);

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
          selected = !selected;
        });
      },
      child: Column(
        children: [
          Container(
            width: 222,
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

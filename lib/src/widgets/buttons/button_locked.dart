import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';

class ButtonLocked extends StatefulWidget {
  final String text1;
  final String text2;

  ButtonLocked({Key key, this.text1, this.text2}) : super(key: key);

  @override
  _ButtonLockedState createState() => _ButtonLockedState();
}

class _ButtonLockedState extends State<ButtonLocked> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Stack(
        children: [
          buildCardLocked(),
          Positioned(
            right: 30,
            top: 2,
            child: Container(
              width: 59,
              height: 19,
              decoration: BoxDecoration(
                color: selected ? Color(0xffFFCE00) : Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Text(
                  selected ? 'DONE' : 'WAIT',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildCardLocked() {
    return AnimatedContainer(
      width: Device.width,
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.symmetric(horizontal: 28),
      height: 65,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: selected ? Color(0xffFFCE00) : Colors.white,
            width: 2,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(2),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 37,
                  width: 37,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selected ? Color(0xffFFCE00) : Colors.white,
                      width: 1,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          color:
                              selected ? Color(0xffFFCE00) : Colors.transparent,
                          shape: BoxShape.circle,
                        )),
                  ),
                ),
                SizedBox(width: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.text1,
                      style: TextStyle(
                        fontSize: 16,
                        color: selected ? Color(0xffFFCE00) : Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.text2,
                      style: TextStyle(
                        color: selected ? Color(0xffFFCE00) : Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

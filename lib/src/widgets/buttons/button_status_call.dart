import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class ButtonStatusCall extends StatefulWidget {
  final String text1;
  final String text2;
  final Color color;

  ButtonStatusCall(
      {Key key, this.text1, this.text2, this.color = const Color(0xffFFCE00)})
      : super(key: key);

  @override
  _ButtonStatusCallState createState() => _ButtonStatusCallState();
}

class _ButtonStatusCallState extends State<ButtonStatusCall> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          setState(() {
            selected = !selected;
          });
          buildshowDialoge(widget.text1, widget.text2, context);
        });
      },
      child: buildCardLocked(),
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
            SvgIcon(
              icon: "locked",
              color: widget.color,
            ),
          ],
        ),
      ),
    );
  }
}

void buildshowDialoge(String emojie, String title, BuildContext context) {
  showDialog(
      builder: (_) => new AlertDialog(
            backgroundColor: Color(0xffFFCE00),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: new Text(
                    emojie,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    "UNLOCKED " + title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF313036),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Watch video ad to unlocked " + title.toLowerCase() + "!",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color(0xFF313036),
                    ),
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                child: Center(
                  child: Container(
                    width: Device.width * 0.6,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      color: Color(0xFF313036),
                    ),
                    child: Center(
                      child: Text("WATCH VIDEO",
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFFCE00))),
                    ),
                  ),
                ),
                onPressed: () {
                  //TODO
                },
              ),
              FlatButton(
                child: Center(
                  child: Text(
                    'No,Thank you',
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF313036)),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
      context: context);
}

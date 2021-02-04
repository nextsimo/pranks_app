import 'package:flutter/material.dart';
import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';
import 'package:prank/src/widgets/buttons/button_continue.dart';
import 'package:prank/src/widgets/more/container_black.dart';

class TimeToCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF313036),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                AppBarWithEmoji(text: "Schedule Time"),
                SizedBox(height: 20),
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage("assets/img.webp"),
                      )),
                ),
                SizedBox(height: 23),
                ButtonCall(
                  text1: "CALL",
                  text2: "Now",
                ),
                SizedBox(height: 5),
                ButtonCall(
                  text1: "CALL",
                  text2: "10 SECOND",
                ),
                SizedBox(height: 5),
                ButtonCall(
                  text1: "CALL",
                  text2: "30 SECOND",
                ),
                SizedBox(height: 5),
                ButtonCall(
                  text1: "CALL",
                  text2: "60 SECOND ",
                ),
                SizedBox(height: 5),
                ButtonCall(
                  text1: "CALL",
                  text2: "80 SECOND",
                ),
                SizedBox(height: 21),
                Container(
                  child: ButtonContinue(
                    color: Color(0xFFFFCE00),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ContainerBlack(),
          ),
        ],
      ),
    );
  }
}

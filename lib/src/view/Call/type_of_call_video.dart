import 'package:flutter/material.dart';
import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';
import 'package:prank/src/widgets/buttons/button_continue.dart';
import 'package:prank/src/widgets/buttons/button_status_call.dart';
import 'package:prank/src/widgets/more/container_black.dart';

class TypeOfCallVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                AppBarWithEmoji(
                  text: "Type of Video Call",
                ),
                SizedBox(height: 20),
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage("assets/img.webp"),
                    ),
                  ),
                ),
                SizedBox(height: 23),
                ButtonCall(
                  text1: "😀😘😍",
                  text2: "HAPPY CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "😤😠😡",
                  text2: "ANGRY CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "😝😜🤪",
                  text2: "FUNNY CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "💕❤️❤️",
                  text2: "LOVE CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "👩🏻‍🌾👩🏼‍🍳✌️",
                  text2: "COOKING CALL",
                ),
                SizedBox(height: 21),
                ButtonContinue(
                  color: Color(0xFFFFCE00),
                ),
                SizedBox(height: 21),
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

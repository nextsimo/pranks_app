import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/Call/call.dart';

import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';
import 'package:prank/src/widgets/buttons/button_continue.dart';
import 'package:prank/src/widgets/buttons/button_status_call.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/container_black.dart';

class TypeOfCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                AppBarWithEmoji(
                  text: "Type of Call",
                  page: () => back(context),
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
                  page: Call(),
                ),
                SizedBox(height: 21),
              ],
            ),
          ),
          Stack(
            children: [
              ContainerBlack(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: AdsContainer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

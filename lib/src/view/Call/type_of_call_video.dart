import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/Call/Incoming_call.dart';
import 'package:prank/src/view/Call/video_call.dart';

import 'package:prank/src/view/animation/box_animation.dart';

import 'package:prank/src/widgets/app_bar/app_bar_with_text.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';

import 'package:prank/src/widgets/buttons/button_status_call.dart';
import 'package:prank/src/widgets/buttons/next_call.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/container_black.dart';

class TypeOfCallVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 300),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppBarWiithText(text: "Type of Call"),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Next(
                        function: () => navigateTo(
                            context,
                            IncommingCall(
                              title: "Incoming Video call ",
                              page: VideoCall(),
                            )),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 35, left: 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      BoxAnimation(),
                    ],
                  ),
                ),
                SizedBox(height: 23),
                ButtonCall(
                  text1: "😀😘😍",
                  text2: "HAPPY VIDEO CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "😤😠😡",
                  text2: "ANGRY VIDEO CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "😝😜🤪",
                  text2: "FUNNY VIDEO CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "💕❤️❤️",
                  text2: "LOVE VIDEO CALL",
                ),
                SizedBox(height: 5),
                ButtonStatusCall(
                  text1: "👩🏻‍🌾👩🏼‍🍳✌️",
                  text2: "COOKING VIDEO CALL",
                ),
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

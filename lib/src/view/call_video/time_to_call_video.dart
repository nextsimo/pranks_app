import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/call_video/type_of_call_video.dart';

import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/button_call.dart';
import 'package:prank/src/widgets/buttons/button_continue.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/container_black.dart';

class TimeToCallVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF313036),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 200),
            child: Column(
              children: [
                AppBarWithEmoji(
                  text: "Schedule Time",
                  page: () => navigateTo(context, NavigationView()),
                ),
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
                    page: TypeOfCallVideo(),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          Stack(
            children: [
              ContainerBlack(),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AdsContainer(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

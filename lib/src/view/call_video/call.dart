import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/container_white.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:prank/src/widgets/more/icon_svg.dart';
import 'package:prank/src/widgets/more/text.dart';
import 'package:share/share.dart';

class Call extends StatelessWidget {
  final String audio;
  Call({this.audio});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF313036),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            SizedBox(height: Device.height * 0.03),
            WhiteContainer(),
            SizedBox(height: Device.height * 0.02),
            Stack(
              children: [
                Container(
                  width: 121,
                  height: 121,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(360),
                    child: Image.asset("assets/img.webp"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color(0xFF03DE8A),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: SvgIcon(icon: "volume-high"),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              children: [
                Text(
                  "Lina Thomson",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFFBFBFD),
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  "00:33",
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xFFFBFBFD),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(70),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconSvg(icon: "volume-mute"),
                      IconSvg(icon: "icon_message"),
                      IconSvg(icon: "awesome-volume"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      WidgetText(text: "Mute"),
                      WidgetText(text: "Chat"),
                      WidgetText(text: "Speaker"),
                    ],
                  ),
                  SizedBox(height: 29),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconSvg(
                        icon: "person-add",
                        test: () {
                          Share.share('check out my website');
                        },
                      ),
                      IconSvg(icon: "awesome-video"),
                      buildContainer(context),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WidgetText(text: "Add"),
                        WidgetText(text: "Video"),
                        WidgetText(text: "End", colore: Color(0xFFFF0000)),
                      ]),
                ],
              ),
            ),
            AdsContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildContainer(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(context, NavigationView());
      },
      child: Container(
        width: 69,
        height: 69,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgIcon(icon: "decline_call"),
        ),
      ),
    );
  }
}

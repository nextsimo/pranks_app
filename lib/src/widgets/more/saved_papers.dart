import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

import 'container_white.dart';

class SavedPapers extends StatelessWidget {
  final List<RowIconsWithText> list = [
    RowIconsWithText(icon: "walppaper_icon", text: "SET WALLPAPER"),
    RowIconsWithText(icon: "lock_screen", text: "SET LOCK SCREEN"),
    RowIconsWithText(icon: "adjust", text: "ADJUST"),
    RowIconsWithText(icon: "sve", text: "SVE TO MEDIA FOLDER"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What would you like to do?",
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF3F4F6),
                ),
                child: InkWell(
                  onTap: () => back(context),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgIcon(
                      icon: "close",
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Text(
              "Select here",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5F5F5F),
              ),
            ),
          ),
          Column(children: list.map((e) => buildIcons(e)).toList()),
          SizedBox(height: 20),
          WhiteContainer(
            color: Color(0xFFBEBEBE),
          )
        ],
      ),
    );
  }

  Widget buildIcons(RowIconsWithText e) {
    return Padding(
      padding: const EdgeInsets.only(left: 65, top: 36),
      child: Row(
        children: [
          SvgIcon(
            icon: e.icon,
          ),
          SizedBox(width: 40),
          Text(
            e.text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5F5F5F),
            ),
          ),
        ],
      ),
    );
  }
}

class IconsPapers {
  final String icon;
  final Function function;

  IconsPapers({this.function, this.icon});
}

class RowIconsWithText {
  final String text, icon;

  RowIconsWithText({this.text, this.icon});
}

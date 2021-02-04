import 'package:flutter/material.dart';
import 'package:prank/src/widgets/app_bar/back_app_bar.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class DownloadPapers extends StatelessWidget {
  final List<IconsPapers> list = [
    IconsPapers(icon: "share", function: null),
    IconsPapers(icon: "download", function: null),
    IconsPapers(icon: "favorite", function: null),
    IconsPapers(icon: "Ellipse", function: null),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF202020),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(children: [
          BackAppBar(
            icone: "back",
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  "assets/img.webp",
                  fit: BoxFit.cover,
                  height: 587,
                  width: 307,
                ),
              ),
              Row(children: list.map((e) => buildIcons(e)).toList()),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildIcons(IconsPapers e) {
    return Padding(
      padding: const EdgeInsets.only(left: 65, top: 36),
      child: Row(
        children: [
          SvgIcon(
            icone: e.icon,
          ),
        ],
      ),
    );
  }
}

class IconsPapers {
  final Widget function;
  final String icon;

  IconsPapers({this.function, this.icon});
}

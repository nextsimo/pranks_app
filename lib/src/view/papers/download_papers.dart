import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/app_bar/back_app_bar.dart';
import 'package:prank/src/widgets/more/saved_papers.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class DownloadPapers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<IconsPapers> list = [
      IconsPapers(icon: "share", widget: SizedBox()),
      IconsPapers(icon: "download", widget: SizedBox()),
      IconsPapers(icon: "favorite-border", widget: SavedPapers()),
      IconsPapers(icon: "Ellipse", widget: SavedPapers()),
    ];
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SingleChildScrollView(
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
              Row(children: list.map((e) => buildIcons(e, context)).toList()),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildIcons(IconsPapers e, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 36),
      child: Container(
        child: InkWell(
          onTap: () {
            showbootmdialogue(context, e.widget);
          },
          child: SvgIcon(
            icon: e.icon,
          ),
        ),
      ),
    );
  }
}

class IconsPapers {
  final Widget widget;
  final String icon;

  IconsPapers({this.widget, this.icon});
}

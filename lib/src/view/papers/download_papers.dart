import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';

import 'package:prank/src/widgets/app_bar/back_app_bar.dart';
import 'package:prank/src/widgets/more/saved_papers.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:provider/provider.dart';

class DownloadPapers extends StatelessWidget {
  final String image;
  final int index;

  const DownloadPapers({Key key, @required this.image, this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.watch<WallpapersService>();
    bool inFavorite = papersService.favorites.contains(image);

    final List<IconsPapers> list = [
      IconsPapers(icon: "share", widget: () {}),
      IconsPapers(icon: "download", widget: () {}),
      IconsPapers(
          icon: inFavorite ? 'favorite_ic' : "favorite-border",
          widget: () => papersService.addToFavorite(image)),
      IconsPapers(icon: "Ellipse", widget: () => show(context)),
    ];
    return Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 50),
        child: Column(children: [
          BackAppBar(
            icone: "back",
            function: () => back(context),
          ),
          Column(
            children: [
              Hero(
                tag: "wallpapers$index",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: CachedNetworkImage(
                    imageUrl: getImagePath(image),
                    fit: BoxFit.cover,
                    height: Device.height * 0.7,
                    width: 307,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: list.map((e) => buildIcons(e)).toList()),
            ],
          ),
        ]),
      ),
    );
  }

  Widget buildIcons(IconsPapers e) {
    return InkWell(
      onTap: e.widget,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SvgIcon(
          icon: e.icon,
          color: Colors.white,
        ),
      ),
    );
  }
}

void show(BuildContext context) {
  showModalBottomSheet<void>(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(44))),
    context: context,
    builder: (BuildContext context) {
      return SavedPapers();
    },
  );
}

class IconsPapers {
  final Function widget;
  final String icon;

  IconsPapers({this.widget, this.icon});
}

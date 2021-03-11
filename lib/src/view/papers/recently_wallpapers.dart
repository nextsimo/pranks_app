import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/wallpapers_model.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/papers/download_papers.dart';

import 'package:prank/src/widgets/app_bar/app_bar_with_text.dart';

class RecentlyWallpapars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<WallpapersModel> wallpapers = papersService.papers;
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.fromLTRB(14, 120, 14, 130),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(wallpapers.length, (index) {
              WallpapersModel model = wallpapers[index];
              return InkWell(
                onTap: () => navigateTo(
                    context,
                    DownloadPapers(
                      image: model.image,
                      index: index,
                    )),
                child: Hero(
                  tag: 'wallpapers$index',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CachedNetworkImage(
                      imageUrl: getImagePath(model.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }),
          ),
          AppBarWiithText(
            text: "Recently wallpapers",
          ),
        ],
      ),
    );
  }
}

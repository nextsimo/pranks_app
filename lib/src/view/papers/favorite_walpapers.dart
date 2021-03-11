import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';

import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/view/papers/download_papers.dart';

import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/favorite_button.dart';

class FavoriteWalPapers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> favPapers = papersService.favorites;
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.fromLTRB(14, 120, 14, 130),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(favPapers.length, (index) {
              String image = favPapers[index];
              return InkWell(
                onTap: () => navigateTo(
                    context,
                    DownloadPapers(
                      image: image,
                      index: index,
                    )),
                child: Stack(
                  children: [
                    Hero(
                      tag: 'wallpapers$index',
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                  getImagePath(image)),
                            )),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: FavoriteButton(),
                    ),
                  ],
                ),
              );
            }),
          ),
          AppBarWithEmoji(
            text: "Favorite wallpapers",
            page: () => navigateTo(context, NavigationView()),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/papers/download_papers.dart';
import 'package:prank/src/widgets/app_bar/app_bar_with_text.dart';

class PopularesWallpapes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.fromLTRB(14, 120, 14, 130),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(20, (index) {
              int randomId = Random().nextInt(100);
              return InkWell(
                onTap: () => navigateTo(
                    context,
                    DownloadPapers(
                      image: 'https://picsum.photos/id/$randomId/200/300',
                      index: index,
                    )),
                child: Hero(
                  tag: 'wallpapers$index',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://picsum.photos/id/$randomId/200/300',
                          ),
                        )),
                  ),
                ),
              );
            }),
          ),
          AppBarWiithText(
            text: "Popular wallpapers",
          ),
        ],
      ),
    );
  }
} //Popular wallpapers

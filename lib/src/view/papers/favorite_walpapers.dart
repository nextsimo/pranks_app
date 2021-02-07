import 'dart:math';

import 'package:flutter/material.dart';

import 'package:prank/src/widgets/app_bar/app_bar_emoji.dart';
import 'package:prank/src/widgets/buttons/favorite_button.dart';

class FavoriteWalPapers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212121),
      child: Stack(
        children: [
          GridView.count(
            padding: EdgeInsets.fromLTRB(14, 120, 14, 100),
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: List.generate(20, (index) {
              int randomId = Random().nextInt(100);
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://picsum.photos/id/$randomId/200/300',
                          ),
                        )),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 8,
                    child: FavoriteButton(),
                  ),
                ],
              );
            }),
          ),
          AppBarWithEmoji(
            text: "Favorite wallpapers",
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/view/home/custom_slider.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class HommePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF303030),
      child: Container(
        child: Column(
          children: [
            buildAppBar(),
            SizedBox(
              height: 25,
            ),
            buildContainer('Recently wallpapers'),
            SizedBox(
              height: 28,
            ),
            Container(
              child: Column(
                children: [
                  CarouselWithIndicatorDemo(),
                ],
              ),
            ),
            SizedBox(height: 123),
            buildContainer(
              "Popular Wallpapers",
            ),
            SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: AssetImage("assets/img.webp"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: buildMiniCard("Adventure"),
                        ),
                        SizedBox(height: 21),
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            image: DecorationImage(
                              image: AssetImage("assets/img.webp"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          alignment: Alignment.bottomLeft,
                          child: buildMiniCard("Arcade"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Container(
                      width: 152,
                      height: 151,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: DecorationImage(
                          image: AssetImage("assets/img.webp"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                      child: buildMiniCard("Action"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(47),
                      topLeft: Radius.circular(47)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 31),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 46,
                        width: 44,
                        decoration: BoxDecoration(
                          color: Color(0xFF313036),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: SvgIcon(icone: "icon_person"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Hi, welcome to the best app",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          Text(
                            "Have a good day",
                            style: TextStyle(
                                color: Color(0xFF3D3D3D), fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildMiniCard(String text) {
    return Container(
      width: 80,
      height: 25,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        color: Colors.black,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 11),
        ),
      ),
    );
  }
  //'https://picsum.photos/id/$randomId/200/300'

  Container buildContainer(String text) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            width: 190,
          ),
          Text(
            "see all",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget buildAppBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 35, left: 20),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, Merry Smith!✌️",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "Call and chat with Lina Thomson",
                  style: TextStyle(
                    color: Color(0xFFB9B9B9),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 40),
          Container(
            child: Column(
              children: [
                SvgIcon(icone: "avatar"),
              ],
            ),
          ),
          SizedBox(width: 10),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                SvgIcon(
                  icone: "Group",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

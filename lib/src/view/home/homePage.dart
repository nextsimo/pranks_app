import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/wallpapers_model.dart';
import 'package:prank/src/services/ads/ads_service.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/ads/banner_ads_view.dart';
import 'package:prank/src/view/animation/box_animation.dart';
import 'package:prank/src/view/home/custom_slider.dart';
import 'package:prank/src/view/papers/wallpapers_popular.dart';
import 'package:prank/src/view/profile/profile_view.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:provider/provider.dart';

class HommePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF303030),
      child: Stack(
        children: [
          SizedBox(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 250, top: 60),
              child: Column(
                children: [
                  buildAppBar(context),
                  SizedBox(height: 25),
                  CarouselWithIndicatorDemo(),
                  SizedBox(height: 20),
                  buildContainer(
                    "Popular Wallpapers",
                    context,
                    PopularesWallpapes(),
                  ),
                  SizedBox(height: 18),
                  Container(
                    child: Selector<WallpapersService, List<WallpapersModel>>(
                      selector: (_, m) => m.popularsPapers,
                      builder: (_, popularsPapers, __) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 12),
                          width: Device.width,
                          child: buildRow(popularsPapers),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 21),
                ],
              ),
            ),
          ),
          Consumer<AdsService>(builder: (_, adsSerivce, __) {
            if (adsSerivce.banners.isEmpty) return SizedBox();
            return BannerAdsView(
              adsModel: adsService.banners.first,
            );
          }),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Consumer<AdsService>(builder: (_, adsSerivce, __) {
                  if (adsSerivce.banners.isEmpty) return SizedBox();
                  return BannerAdsView(
                    adsModel: adsService.banners.last,
                  );
                }),
                SizedBox(height: 15),
                Container(
                  height: 172,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(47),
                        topLeft: Radius.circular(47)),
                  ),
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.only(left: 31, top: 15),
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
                        child: SvgIcon(icon: "icon_person"),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hi, welcome to the best app",
                            style: TextStyle(color: Colors.white, fontSize: 16),
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
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(List<WallpapersModel> papers) {
    if (papers.length == 1) {
      return Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          image: DecorationImage(
            image: CachedNetworkImageProvider(getImagePath(papers[0].image)),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomLeft,
        child: buildMiniCard(papers[0].category),
      );
    } else if (papers.length == 2) {
      return Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 14),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(getImagePath(papers[0].image)),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: buildMiniCard(papers[0].category),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 14),
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: DecorationImage(
                  image:
                      CachedNetworkImageProvider(getImagePath(papers[1].image)),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomLeft,
              child: buildMiniCard(papers[1].category),
            ),
          ),
        ],
      );
    }

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        getImagePath(papers[0].image)),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: buildMiniCard(papers[0].category),
              ),
              SizedBox(height: 21),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        getImagePath(papers[1].image)),
                    fit: BoxFit.cover,
                  ),
                ),
                alignment: Alignment.bottomLeft,
                child: buildMiniCard(papers[1].category),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            margin: EdgeInsets.only(left: 14),
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image:
                    CachedNetworkImageProvider(getImagePath(papers[2].image)),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: buildMiniCard(papers[2].category),
          ),
        ),
      ],
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

  Container buildContainer(String text, BuildContext context, Widget widget) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              navigateTo(context, widget);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "see all",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Row(
        children: [
          SizedBox(width: 15),
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
          Expanded(child: SizedBox()),
          BoxAnimation(),
/* */
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              navigateTo(context, ProfileView());
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white),
              ),
              child: Center(
                child: Icon(
                  Icons.person,
                  size: 38,
                  color: Colors.grey[300],
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
        ],
      ),
    );
  }
}

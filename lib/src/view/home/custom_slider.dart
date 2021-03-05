import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:prank/src/models/wallpapers_model.dart';
import 'package:prank/src/services/wallpapers_service.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/papers/download_papers.dart';
import 'package:prank/src/view/papers/recently_wallpapers.dart';
import 'package:provider/provider.dart';

class CarouselWithIndicatorDemo extends StatefulWidget {
  const CarouselWithIndicatorDemo({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
/*     final List<Widget> imageSliders =
        List<Widget>.generate(imgList.length, (index) {
      final String item = imgList[index];
      return 
    }); */
    return Selector<WallpapersService, List<WallpapersModel>>(
      builder: (_, papers, __) {
        if (papers.isEmpty) return SizedBox();
        int length = 0;
        if (papers.length > 6) {
          length = 6;
        } else {
          length = papers.length;
        }
        return Column(
          children: [
            buildContainer(
                'Recently wallpapers', context, RecentlyWallpapars()),
            SizedBox(height: 18),
            CarouselSlider.builder(
              itemCount: length,
              itemBuilder: (_, int index) {
                WallpapersModel model = papers[index];
                return InkWell(
                  onTap: () {
                    navigateTo(
                      context,
                      DownloadPapers(
                        image: model.image,
                        index: index,
                      ),
                    );
                  },
                  child: Hero(
                    tag: 'wallpapers$index',
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        child: Stack(
                          children: <Widget>[
                            CachedNetworkImage(
                              imageUrl: getImagePath(model.image),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
              options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(length, (index) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }),
            ),
          ],
        );
      },
      selector: (_, m) => m.papers,
    );
  }

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
}

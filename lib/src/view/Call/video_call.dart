import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';

import 'package:prank/src/widgets/more/svg_icon.dart';

class VideoCall extends StatelessWidget {
  final List<Icons> list = [
    Icons(icon: "message"),
    Icons(icon: "accept_call"),
    Icons(icon: "volume-mute"),
    Icons(icon: "accept_call", backgrnd: Color(0xffFF0000)),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xff1A1920),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 100),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: Device.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/img.webp"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, top: 80),
                      child: Container(
                        width: Device.height * 0.10,
                        height: 122,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          border: Border.all(
                            color: Color(0xff313036),
                            width: 1,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            image: DecorationImage(
                                image: AssetImage("assets/profil.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        "Lina Thomson",
                        style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "00:32",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.map((e) => buildCContainer(e)).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCContainer(Icons e) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () {
            //TODO
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: e.backgrnd,
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: SvgIcon(icon: e.icon, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class Icons {
  final String icon;
  final Color backgrnd;

  Icons({this.icon, this.backgrnd = const Color(0xff707070)});
}

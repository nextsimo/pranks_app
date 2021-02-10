import 'package:flutter/material.dart';
import 'package:prank/src/services/video_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/camera/camera_view.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:video_player/video_player.dart';

class VideoCall extends StatelessWidget {
  final List<Icons> list = [
    Icons(icon: "chat_call"),
    Icons(icon: "accept_call"),
    Icons(icon: "volume-mute"),
    Icons(icon: "accept_call", backgrnd: Color(0xffFF0000)),
  ];
  @override
  Widget build(BuildContext context) {
    final VideoPlayerService videoPlayerService = locator<VideoPlayerService>();
    videoPlayerService.loadVideo();
    var align = Padding(
      padding: const EdgeInsets.only(right: 30, top: 80),
      child: CameraView(),
    );
    return Material(
      color: Color(0xff1A1920),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: Device.height * 0.76,
              width: Device.width,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: Device.width,
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                      child: AspectRatio(
                        aspectRatio: Device.width / Device.height * 0.76,
                        child: VideoPlayer(
                          videoPlayerService.videoPlayerController,
                        ),
                      ),
                    ),
                  ),
                  align,
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
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
                    ),
                  )
                ],
              ),
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
        padding: const EdgeInsets.all(8),
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

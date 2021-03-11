import 'package:flutter/material.dart';
import 'package:prank/src/services/video_service.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/call_video/call.dart';

import 'package:prank/src/view/camera/camera_view.dart';
import 'package:prank/src/view/chat/chat.dart';
import 'package:prank/src/view/home/homePage.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:video_player/video_player.dart';

class VideoCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Icons> list = [
      Icons(
          icon: "chat_call",
          page: () {
            navigateTo(context, ChatView());
          }),
      Icons(
          icon: "accept_call",
          page: () {
            navigateTo(context, Call());
          }),
      Icons(
          icon: "volume-mute",
          page: () {
            locator<VideoPlayerService>().videoPlayerController.setVolume(0);
          }),
      Icons(
          icon: "accept_call",
          backgrnd: Color(0xffFF0000),
          page: () {
            locator<VideoPlayerService>().videoPlayerController.pause();
            locator<VideoPlayerService>().videoPlayerController.initialize();
            navigateTo(context, NavigationView());
          }),
    ];
    final VideoPlayerService videoPlayerService = locator<VideoPlayerService>();
    videoPlayerService.loadVideo();
    var align = Padding(
      padding: const EdgeInsets.only(right: 30, top: 80),
      child: CameraView(),
    );
    return WillPopScope(
      onWillPop: () async => false,
      child: Material(
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
                          aspectRatio: Device.width / Device.height * 0.86,
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
              AdsContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCContainer(Icons e) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: InkWell(
          onTap: e.page,
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
  final Function page;

  Icons({this.page, this.icon, this.backgrnd = const Color(0xff707070)});
}

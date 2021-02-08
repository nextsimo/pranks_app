import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/view/Call/Incoming_call.dart';
import 'package:prank/src/view/Call/call.dart';
import 'package:prank/src/view/Call/video_call.dart';
import 'package:prank/src/view/chat/chat.dart';
import 'package:prank/src/view/home/homePage.dart';
import 'package:prank/src/view/navigation/bottom_app_bar.dart';
import 'package:prank/src/view/papers/favorite_walpapers.dart';

class NavigationView extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Device.init(context);
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CustomBottomAppBar(pageController: pageController),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          HommePage(),
          ChatView(),
          VideoCall(),
          Call(),
          FavoriteWalPapers(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/widgets/app_bar/back_app_bar.dart';
import 'package:prank/src/widgets/buttons/button_continue.dart';
import 'package:prank/src/widgets/buttons/button_locked.dart';
import 'package:prank/src/widgets/more/ads_container.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class LockedView extends StatelessWidget {
  final String title;
  final Widget page;
  final List<Step> list = [
    Step(icon: "star", textStep: "Step 1 just rate the app with 5 star"),
    Step(icon: "star", textStep: "Step 2 just watch video ads promo "),
    Step(
        icon: "star",
        textStep:
            "Step 3 just Give us 1\$ if you have it and it’s not necessary"),
  ];

  LockedView({Key key, this.title, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        body(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 190,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 19, top: 18),
                child: Column(
                  children: list.map((e) => buildText(e)).toList(),
                ),
              ),
            ]),
          ),
        )
      ],
    );
  }

  Widget buildText(Step e) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SvgIcon(icon: e.icon),
          SizedBox(width: 6),
          Text(
            e.textStep,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 200),
      child: Column(
        children: [
          SafeArea(
            child: AdsContainer(),
            bottom: false,
          ),
          BackAppBar(
              icone: "close",
              function: () => navigateTo(context, NavigationView())),
          SizedBox(
            height: 5,
          ),
          SvgIcon(
            icon: "lock",
          ),
          SizedBox(height: 5),
          Text(title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 33,
          ),
          ButtonLocked(
            text1: "RATE THE APP",
            text2: "GIVE US FIVE STARS ",
          ),
          SizedBox(
            height: 30,
          ),
          ButtonLocked(
            text1: "ADS VIDEO",
            text2: "WATCH VIDEO ADS",
          ),
          SizedBox(
            height: 30,
          ),
          ButtonLocked(
            text1: "DONATE",
            text2: "GIVE US 1\$ PAYPAL",
          ),
          SizedBox(
            height: 35,
          ),
          ButtonContinue(page: page),
        ],
      ),
    );
  }
}

class Step {
  final String icon;
  final String textStep;
  Step({this.icon, this.textStep});
}

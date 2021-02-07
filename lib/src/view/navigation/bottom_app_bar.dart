import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/view/navigation/bottom_app_bar_model.dart';
import 'package:prank/src/view/navigation/build_icon.dart';
import 'package:provider/provider.dart';

class CustomBottomAppBar extends StatelessWidget {
  final PageController pageController;
  CustomBottomAppBar({Key key, this.pageController}) : super(key: key);

  final List<BottomAppBarModel> icons = [
    BottomAppBarModel(icon: 'home', selcted: true),
    BottomAppBarModel(icon: 'message'),
    BottomAppBarModel(icon: 'video'),
    BottomAppBarModel(icon: 'call'),
    BottomAppBarModel(icon: 'favorite'),
  ];

  @override
  Widget build(_) {
    return ChangeNotifierProvider<BottomAppBarProvider>(
      create: (_) => BottomAppBarProvider(),
      builder: (BuildContext context, __) {
        return Container(
          width: Device.width,
          padding: EdgeInsets.only(top: 4, bottom: 0, left: 8, right: 8),
          decoration: buildBoxDecoration(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List<Widget>.generate(icons.length, (index) {
              return buildIcon(index);
            }),
          ),
        );
      },
    );
  }

  Widget buildIcon(int index) {
    final BottomAppBarModel model = icons[index];
    return BuildBottomAppBarIcon(
      pageController: pageController,
      index: index,
      icon: model.icon,
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      color: Color(0xfffffefe),
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.09),
          blurRadius: 42,
          offset: Offset(0, -4),
        ),
      ],
    );
  }
}

class BottomAppBarModel {
  final String icon;
  final bool selcted;

  BottomAppBarModel({this.icon, this.selcted = false});
}

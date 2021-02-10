import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/view/navigation/bottom_app_bar_model.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';
import 'package:provider/provider.dart';

class BuildBottomAppBarIcon extends StatelessWidget {
  final int index;
  final String icon;
  final PageController pageController;

  const BuildBottomAppBarIcon(
      {Key key, this.icon, this.pageController, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = Device.width * 0.16;
    final BottomAppBarProvider provider = Provider.of(context, listen: false);
    return InkWell(
      onTap: () {
        pageController.jumpToPage(index);
        provider.selectedIndex = index;
      },
      child: Selector<BottomAppBarProvider, int>(
        selector: (_, m) => m.selectedIndex,
        builder: (_, int selectedIndex, __) {
          bool selected = index == selectedIndex;
          return SizedBox(
            width: size,
            height: size,
            child: Center(
              child: SvgIcon(
                icon: icon,
                size: selected ? 27 : 20,
                color: selected ? Colors.white : Color(0xffA8A8A8),
              ),
            ),
          );
        },
      ),
    );
  }
}

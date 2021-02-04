import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class SocialIcon extends StatelessWidget {
  final String icon;

  const SocialIcon({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Color(0xff3E3E3E), width: 2.0)),
      child: Center(
          child: SvgIcon(
        icone: icon,
      )),
    );
  }
}

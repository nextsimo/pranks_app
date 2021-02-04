import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgIcon extends StatelessWidget {
  final String icone;
  final double size;
  final Color color;

  const SvgIcon({Key key, this.icone, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/$icone.svg',
      width: size,
      color: color,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class IconSvg extends StatefulWidget {
  final String icon;
  final Function test;

  const IconSvg({Key key, this.icon, this.test}) : super(key: key);

  @override
  _IconSvgState createState() => _IconSvgState();
}

class _IconSvgState extends State<IconSvg> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.test,
      child: Container(
        height: 69,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgIcon(icon: widget.icon),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Container(
        child: SvgIcon(
          icon: "heart_favorite",
          color: selected ? Colors.red : Colors.white,
        ),
      ),
    );
  }
}

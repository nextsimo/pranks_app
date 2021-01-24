import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class BackAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () => back(context),
        child: Container(
          width: 55,
          height: 55,
          margin: const EdgeInsets.only(top: 50),
          child: Center(
            child: SvgIcon(
              icon: 'back',
              size: 13,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class BackAppBar extends StatelessWidget {
  final String icone;
  final Alignment align;

  const BackAppBar({Key key, this.icone, this.align = Alignment.centerLeft})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: InkWell(
        onTap: () => back(context),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              margin: const EdgeInsets.only(top: 50),
              child: Center(
                child: SvgIcon(
                  icone: icone,
                  size: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

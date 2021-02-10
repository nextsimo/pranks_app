import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class BackAppBar extends StatelessWidget {
  final String icone;
  final Alignment align;
  final Function function;

  const BackAppBar(
      {Key key, this.icone, this.align = Alignment.centerLeft, this.function})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50, left: 20),
            child: InkWell(
              onTap: function,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgIcon(
                  icon: icone,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

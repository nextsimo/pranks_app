import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class AppBarWiithText extends StatelessWidget {
  final String text;

  const AppBarWiithText({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 11),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              back(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgIcon(
                icon: "back",
              ),
            ),
          ),
          SizedBox(
            width: 25,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

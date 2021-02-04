import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class AppBarWithEmoji extends StatelessWidget {
  final String text;

  const AppBarWithEmoji({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  back(context);
                },
                child: SvgIcon(
                  icone: "back",
                ),
              ),
              SizedBox(width: 9),
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
          SvgIcon(icone: "avatar"),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class AppBarWithEmoji extends StatelessWidget {
  final String text;
  final Function page;

  const AppBarWithEmoji({Key key, this.text, this.page}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              InkWell(
                onTap: page,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgIcon(
                    icon: "back",
                  ),
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
          Container(
            margin: EdgeInsets.only(right: 12),
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

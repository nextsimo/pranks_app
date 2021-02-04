import 'package:flutter/material.dart';

import 'package:prank/src/widgets/app_bar/back_app_bar.dart';
import 'package:prank/src/widgets/more/avatar_profil.dart';
import 'package:prank/src/widgets/more/custom_divider.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class ProfileDetailView extends StatelessWidget {
  final List<EditeProfileModel> list = [
    EditeProfileModel(icon: "person", title: "Name", content: "Merry Smith"),
    EditeProfileModel(icon: "call", title: "Phone", content: "+512 193006894"),
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Color(0xFF1A1920),
        child: Column(
          children: [
            BackAppBar(
              icone: "back",
            ),
            SizedBox(
              height: 74,
            ),
            Stack(
              //alignment: Alignment.bottomRight,
              children: [
                ProfilAvatar(
                  size: 250,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: SvgIcon(
                    icone: "add",
                  ),
                )
              ],
            ),
            SizedBox(
              height: 41,
            ),
            Column(
              children: list.map((e) => buildRow(e)).toList()
                ..insert(
                  1,
                  CustomDivider(height: 1),
                ),
            )
          ],
        ));
  }

  Widget buildRow(EditeProfileModel e) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          SvgIcon(
            icone: e.icon,
          ),
          SizedBox(
            width: 28,
          ),
          buildInput(e),
        ],
      ),
    );
  }

  Expanded buildInput(EditeProfileModel e) {
    final TextEditingController controller =
        TextEditingController(text: e.content);
    return Expanded(
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24, color: Colors.white),
        decoration: InputDecoration(
          suffixIcon: SvgIcon(
            icone: "edite",
          ),
          suffixIconConstraints: BoxConstraints(),
          border: InputBorder.none,
          labelText: e.title,
          labelStyle: TextStyle(
            fontSize: 21,
            color: Color(0xffC4C4C4),
          ),
        ),
      ),
    );
  }
}

class EditeProfileModel {
  final String title;
  final String content;
  final String icon;

  EditeProfileModel({this.title, this.content, this.icon});
}

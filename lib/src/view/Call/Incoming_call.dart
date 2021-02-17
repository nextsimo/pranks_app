import 'package:flutter/material.dart';
import 'package:prank/src/utils/device.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/view/chat/chat.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:prank/src/widgets/more/container_white.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class IncommingCall extends StatelessWidget {
  final Widget page;
  final String title;

  const IncommingCall({Key key, this.page, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<ButtonCallfunction> list = [
      ButtonCallfunction(
          color: Color(0xFFDE3955),
          icon: "decline_call",
          function: () => navigateTo(context, NavigationView())),
      ButtonCallfunction(
          color: Color(0xFF469780),
          icon: "accept_call",
          function: () => navigateTo(context, page)),
      ButtonCallfunction(
          color: Color(0xFFF3AB7C),
          icon: "message",
          function: () => navigateTo(context, ChatView())),
    ];
    Device.init(context);
    return Material(
      color: Color(0xFF313036),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: WhiteContainer(),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 21, color: Colors.white),
            ),
            buildPadding(),
            Column(
              children: [
                Text(
                  "Lina Thomson",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  "+512 721383029",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: Device.width,
              height: Device.height * 0.17,
              color: Colors.lime,
              child: Center(
                child: Text('ADS'),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: list.map((e) => buildPaddingCall(e)).toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPaddingCall(ButtonCallfunction e) {
    return InkWell(
      onTap: e.function,
      child: Container(
        width: Device.width * 0.22,
        height: 83,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: e.color),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SvgIcon(
            icon: e.icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Opacity(
        opacity: 0.8,
        child: Container(
          height: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border.all(
              width: 0,
              color: Color(0xFFFFFFFF),
              style: BorderStyle.solid,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Opacity(
              opacity: 0.8,
              child: Container(
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: Color(0xFFFFFFFF),
                    style: BorderStyle.solid,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Opacity(
                    opacity: 1,
                    child: Container(
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        border: Border.all(
                          color: Color(0xFFFFFFFF),
                          style: BorderStyle.solid,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset("assets/img.webp"),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonCallfunction {
  final String icon;
  final Color color;
  final Function function;

  ButtonCallfunction({this.function, this.icon, this.color});
}

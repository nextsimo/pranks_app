import 'package:flutter/material.dart';
import 'package:prank/src/widgets/more/container_white.dart';
import 'package:prank/src/widgets/more/svg_icon.dart';

class IncommingCall extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              "Incoming call ",
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
            SizedBox(height: 130),
            buildPaddingCall()
          ],
        ),
      ),
    );
  }

  Padding buildPaddingCall() {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              height: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFDE3955),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SvgIcon(
                  icone: "decline_call",
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              height: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFF469780),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SvgIcon(
                  icone: "accept_call",
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              //TODO
            },
            child: Container(
              height: 83,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFF3AB7C),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SvgIcon(
                  icone: "message",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildPadding() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Opacity(
        opacity: 0.6,
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

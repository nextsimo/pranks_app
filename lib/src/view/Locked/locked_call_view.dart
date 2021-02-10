import 'package:flutter/material.dart';
import 'package:prank/src/view/Call/call.dart';
import 'package:prank/src/view/Locked/locked_view.dart';

class LockedCallView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1A1920),
      child: LockedView(
        title: "CALL IS LOCKED",
        page: Call(),
      ),
    );
  }
}

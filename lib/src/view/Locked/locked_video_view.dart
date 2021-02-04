import 'package:flutter/material.dart';
import 'package:prank/src/view/Locked/locked_view.dart';

class LockedVideoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1A1920),
      child: LockedView(
        title: "VIDEO IS LOCKED",
      ),
    );
  }
}

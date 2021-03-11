import 'package:flutter/material.dart';

import 'package:prank/src/view/call_video/call/type_of_call.dart';
import 'package:prank/src/view/Locked/locked_view.dart';

class LockedCallView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF1A1920),
      child: LockedView(
        title: "CALL IS LOCKED",
        page: TypeOfCall(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prank/src/view/login/login_view.dart';
import 'package:prank/src/view/profile/profile_view.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileView(),
    );
  }
}

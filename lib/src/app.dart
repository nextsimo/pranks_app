import 'package:flutter/material.dart';
import 'package:prank/src/view/Call/video_call.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';

import 'package:prank/src/view/papers/download_papers.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationView(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

void back(BuildContext context) {
  Navigator.of(context).pop();
}

customShwoBottomSheet(Widget widget, BuildContext context) {
  showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return widget;
    },
  );
}

String getImagePath(String name) {
  return "https://firebasestorage.googleapis.com/v0/b/wallpaper-prank.appspot.com/o/papers%2F$name?alt=media";
}

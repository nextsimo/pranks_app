import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
}

void back(BuildContext context) {
  Navigator.of(context).pop();
}

showbootmdialogue(BuildContext context, Widget widget) {
  showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return widget;
      });
}

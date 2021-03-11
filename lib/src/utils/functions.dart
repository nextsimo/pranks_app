import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

Future<dynamic> navigateTo(BuildContext context, Widget page) async {
  return await Navigator.of(context)
      .push(MaterialPageRoute(builder: (_) => page));
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

Future<bool> rateMyApp(BuildContext context) async {
  bool res = false;
  RateMyApp rateMyApp = RateMyApp();
  await rateMyApp.showRateDialog(context,
      listener: (RateMyAppDialogButton rate) {
    if (rate == RateMyAppDialogButton.rate) {
      // unlock
      res = true;
      return true;
    }
    res = false;
    return false;
  });
  rateMyApp.reset();
  rateMyApp = null;
  return res;
}

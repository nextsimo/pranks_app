import 'package:flutter/material.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/login/login_view.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';

import 'base_view_model.dart';

class BaseView extends StatelessWidget {
  final BaseViewModel model = locator<BaseViewModel>();

  @override
  Widget build(BuildContext context) {
    bool isAuth = model.checkAuth();
    if (isAuth) return NavigationView();
    return LoginView();
  }
}

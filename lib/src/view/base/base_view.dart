import 'package:flutter/material.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/login/login_view.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseViewModel>.value(
      value: locator<BaseViewModel>(),
      builder: (BuildContext context, __) {
        final BaseViewModel model = Provider.of<BaseViewModel>(context);
        model.checkAuth();
        if (model.isAuth == null) return Material();
        if (model.isAuth) return NavigationView();
        return LoginView();
      },
    );
  }
}

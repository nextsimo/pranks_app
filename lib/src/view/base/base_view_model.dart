import 'package:flutter/material.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseViewModel with ChangeNotifier {
  SharedPreferences prefs;
  bool _isAuth;

  bool get isAuth => _isAuth;

  set isAuth(bool isAuth) {
    _isAuth = isAuth;
    notifyListeners();
  }

  Future<void> checkAuth() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('phone_email')) {
      papersService.emailPhone = prefs.getString('phone_email');
      papersService.username = prefs.getString('username_name');
      isAuth = true;
    }
    isAuth = false;
  }
}

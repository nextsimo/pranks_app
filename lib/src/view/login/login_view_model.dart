import 'package:flutter/material.dart';
import 'package:prank/src/utils/functions.dart';
import 'package:prank/src/utils/locator.dart';
import 'package:prank/src/view/navigation/navigation_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController input1Controller = TextEditingController();
  final TextEditingController input2Controller = TextEditingController();
  SharedPreferences prefs;

  LoginViewModel() {
    init();
  }

  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  void sign(BuildContext context) {
    // check if data non empty
    if (input1Controller.text.isNotEmpty && input2Controller.text.isNotEmpty) {
      /// save data in shared prefresences
      prefs.setString('phone_email', input1Controller.text);
      prefs.setString('username_name', input2Controller.text);
      papersService.emailPhone = input1Controller.text;
      papersService.username = input2Controller.text;
      navigateTo(context, NavigationView());
    }
  }
}

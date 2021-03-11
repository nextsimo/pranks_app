import 'package:prank/src/utils/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseViewModel {
  SharedPreferences prefs;

  BaseViewModel() {
    init();
  }
  void init() async {
    prefs = await SharedPreferences.getInstance();
  }

  bool checkAuth() {
    if (prefs.containsKey('phone_email')) {
      papersService.emailPhone = prefs.getString('phone_email');
      papersService.username = prefs.getString('username_name');
      return true;
    }
    return false;
  }
}

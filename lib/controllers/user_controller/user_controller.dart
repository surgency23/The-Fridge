import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  String email = "";
  String pwd = "";
  void signIn(String emailTxt, String pwdTxt) {
    email = emailTxt;
    pwd = pwdTxt;
    notifyListeners();
  }
}

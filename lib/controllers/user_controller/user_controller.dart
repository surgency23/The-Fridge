import 'package:flutter/foundation.dart';
import 'package:the_fridge/services/authservice.dart';

class UserController extends ChangeNotifier {
  String _email = "";
  String _token = "";
  bool _loggedIn = false;
  bool _loading = false;

  String get token => _token;
  String get email => _email;
  bool get loading => _loading;
  bool get loggedIn => _loggedIn;

  Future<void> signIn(String email, String pwdTxt) async {
    _loading = true;

    var response = await AuthService().login(email, pwdTxt);

    _loading = false;

    if (response == null) {
      _loggedIn = false;
    } else {
      _email = email;
      _token = response.data["token"];
      _loggedIn = true;
    }

    notifyListeners();
  }
}

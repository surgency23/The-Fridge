import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/controllers/user_controller/user_controller.dart';

import '../../services/authservice.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var textUserNameController = TextEditingController();
  var textPwdController = TextEditingController();
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: InputDecoration(labelText: "Email"),
          controller: textUserNameController,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(labelText: "Password"),
          controller: textPwdController,
        ),
        ElevatedButton(
            child: Text("Login"),
            onPressed: () {
              AuthService()
                  .login(textUserNameController.text, textPwdController.text)
                  .then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  print(token);
                  Fluttertoast.showToast(
                      msg: "Authenticated!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16);
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const DashBoard()));
                }
              });
            }),
        ElevatedButton(child: Text("Dont have an account?"), onPressed: () {}),
        ElevatedButton(
            child: Text("getinfo"),
            onPressed: () {
              AuthService().getinfo(token).then((val) {
                print(token);
                print(val.data["msg"]);
                Fluttertoast.showToast(
                    msg: val.data["msg"],
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    fontSize: 16);
              });
            }),
      ],
    ));
  }
}

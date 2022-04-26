import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/controllers/user_controller/user_controller.dart';

import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var textUserNameController = TextEditingController();
  var textPwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("LoginScreen")),
        body: Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                TextField(
                  controller: textUserNameController,
                  decoration: InputDecoration(hintText: "EnterUserName"),
                ),
                TextField(
                  controller: textPwdController,
                  decoration: InputDecoration(hintText: "enter pwd"),
                ),
                TextButton(
                    child: Text("login"),
                    onPressed: () {
                      Provider.of<User>(context, listen: false).signIn(
                          textUserNameController.text.toString(),
                          textPwdController.text.toString());
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DashBoard()));
                    })
              ],
            )));
  }
}

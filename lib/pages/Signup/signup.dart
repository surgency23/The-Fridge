import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_fridge/services/authservice.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  var email, password, token, fridgeName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
            decoration: InputDecoration(labelText: "Fridge Name!"),
            onChanged: (val) {
              fridgeName = val;
            }),
        TextField(
            decoration: InputDecoration(labelText: "Email"),
            onChanged: (val) {
              email = val;
            }),
        TextField(
            obscureText: true,
            decoration: InputDecoration(labelText: "Password"),
            onChanged: (val) {
              password = val;
            }),
        ElevatedButton(
            child: Text("Sign up"),
            onPressed: () {
              AuthService().addUser(email, password, fridgeName).then((val) {
                Fluttertoast.showToast(
                    msg: "User Added!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16);
              });
            }),
      ],
    ));
  }
}

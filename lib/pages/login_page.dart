import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:the_fridge/pages/home_page.dart';
import 'package:the_fridge/pages/signup.dart';
import 'package:the_fridge/services/authservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var email, password, token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
            child: Text("Login"),
            onPressed: () {
              AuthService().login(email, password).then((val) {
                if (val.data['success']) {
                  token = val.data['token'];
                  Fluttertoast.showToast(
                      msg: "Authenticated!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                }
              });
            }),
        ElevatedButton(
            child: Text("Dont have an account?"),
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()));
            }),
        ElevatedButton(
            child: Text("getinfo"),
            onPressed: () {
              AuthService().getinfo(token).then((val) {
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

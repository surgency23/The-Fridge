import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/controllers/user_controller/user_controller.dart';
import '../../services/authservice.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  var textEmailController = TextEditingController();
  var textPwdController = TextEditingController();
  final UserController userController = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          decoration: const InputDecoration(labelText: "Email"),
          controller: textEmailController,
        ),
        TextField(
          obscureText: true,
          decoration: const InputDecoration(labelText: "Password"),
          controller: textPwdController,
        ),
        ChangeNotifierProvider.value(
          value: userController,
          child: Consumer<UserController>(
            builder: (_, controller, __) {
              print("is logged in, ${controller.loggedIn}");
              return ElevatedButton(
                  child: Text("Login"),
                  onPressed: () async {
                    if (!controller.loading && !controller.loggedIn) {
                      await controller.signIn(
                          textEmailController.text, textPwdController.text);
                    }
                  });
            },
          ),
        ),
        ElevatedButton(child: Text("Dont have an account?"), onPressed: () {}),
      ],
    ));
  }
}

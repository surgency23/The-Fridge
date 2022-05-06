import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/controllers/user_controller/user_controller.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserController>(builder: (context, user, _) {
      return Scaffold(
          appBar: AppBar(title: Text("DashBoard")),
          body: Center(child: Text(user.email)));
    });
  }
}

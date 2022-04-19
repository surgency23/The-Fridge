import 'package:flutter/material.dart';
import '../Login/login_page.dart';
import '../Signup/signup.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.1), BlendMode.darken),
                      image: const AssetImage("assets/person.jpg"))),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),

              // Expanded(
              //   flex: 3,
              //   child: Column(
              //     children: [
              //       Container(
              //         height: 80,
              //         width: double.infinity,
              //         padding:
              //             const EdgeInsets.only(top: 25, left: 24, right: 24),
              //         child: ElevatedButton(
              //           onPressed: () {},
              //           child: Text(
              //             'Log In',
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.w700,
              //               color: Colors.white,
              //             ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         height: 80,
              //         width: double.infinity,
              //         padding:
              //             const EdgeInsets.only(top: 25, left: 24, right: 24),
              //         child: ElevatedButton(
              //           onPressed: () {},
              //           child: Text(
              //             'Sign Up',
              //             style: TextStyle(
              //               fontSize: 20,
              //               fontWeight: FontWeight.w700,
              //               color: Colors.lightBlue,
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

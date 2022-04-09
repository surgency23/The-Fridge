import 'package:flutter/material.dart';

class InstructionsView extends StatelessWidget {
  final String instructions;
  InstructionsView(this.instructions);
  @override
  Widget build(BuildContext context) {
    return Column(
 cd th     children: [
        Container(
          alignment: Alignment.centerLeft,
          child: const Padding(
              padding: EdgeInsets.only(top: 5, bottom: 5, left: 15),
              child: Text("Instructions:",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20))),
        ),
        Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Text(instructions,
                style: TextStyle(
                  fontSize: 15,
                  foreground: Paint()
                    ..style = PaintingStyle.fill
                    ..color = Colors.white,
                )))
      ],
    );
  }
}

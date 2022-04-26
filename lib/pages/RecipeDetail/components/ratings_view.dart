import 'package:flutter/material.dart';

class RatingsView extends StatelessWidget {
  const RatingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 20,
        ),
        SizedBox(width: 7),
        Text("RATINGS PLACEHOLDER"),
      ],
    );
  }
}

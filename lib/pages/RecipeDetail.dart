import 'package:the_fridge/widgets/IngredientsView.dart';
import 'package:the_fridge/widgets/RatingsView.dart';

import "../modules/recipe.dart";
import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';

import '../widgets/InstructionsView.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: Stack(
          children: [
            //background image
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(.25), BlendMode.darken),
                        image: const NetworkImage(
                            "https://512pixels.net/downloads/macos-wallpapers-6k/10-11-6k.jpg"))),
              ),
            ),
            Positioned(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: .15),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.white.withOpacity(.275)),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                //border: Border.all(color: Colors.red, width: 2)
                                ),
                            child: RatingsView()),
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.red, width: 2)
                                ),
                            child: IngredientsView(recipe.ingredients)),
                        Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.red, width: 2)
                                ),
                            child: InstructionsView(recipe.instructions)),
                      ],
                    ))))
          ],
        ));
  }
}

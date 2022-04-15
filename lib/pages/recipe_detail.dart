import 'package:the_fridge/widgets/ingredients_view.dart';
import 'package:the_fridge/widgets/ratings_view.dart';

import "../classes/recipe.dart";
import 'package:flutter/material.dart';
import '../widgets/instructions_view.dart';

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
                            Colors.black.withOpacity(.50), BlendMode.darken),
                        image: NetworkImage(recipe.image.size1280W))),
              ),
            ),
            //where the actual information lives
            Positioned(
                top: 10,
                left: 10,
                right: 10,
                bottom: 10,
                child: (Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: .15),
                        borderRadius: BorderRadius.circular(15.0),
                        color: Colors.black.withOpacity(0.5)),
                    child: SingleChildScrollView(
                        child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.only(top: 5, bottom: 5),
                            child: const RatingsView()),
                        recipe.servings != null
                            ? Container(
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 5),
                                child: Text(recipe.servings!))
                            : Container(),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: IngredientsView(recipe.ingredients)),
                        Container(
                            alignment: Alignment.centerLeft,
                            child: InstructionsView(recipe.instructions)),
                      ],
                    )))))
          ],
        ));
  }
}

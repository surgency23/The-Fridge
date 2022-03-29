import "../modules/recipe.dart";
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: Material(child: recipeInformation(5, recipe)));
  }

  Widget recipeInformation(double numberPadding, recipe) {
    return Card(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(numberPadding),
                    child: Text("Cook Time: ${recipe.cooktime.toString()}")),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(numberPadding),
                    child: Text("Prep Time: ${recipe.preptime.toString()}")),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(numberPadding),
                    child: Text("Wait Time: ${recipe.waittime.toString()}")),
              ),
              FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                    padding: EdgeInsets.all(numberPadding),
                    child: Text("Servings: ${recipe.servings.toString()}")),
              ),
            ]),
      ),
    );
  }
}

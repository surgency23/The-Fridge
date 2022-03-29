import "../modules/recipe.dart";
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    double numberPadding = 7;
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: Card(
          child: FittedBox(
            fit: BoxFit.contain,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Cook Time: ${recipe.cooktime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Prep Time: ${recipe.preptime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Wait Time: ${recipe.waittime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Servings: ${recipe.servings.toString()}")),
            ]),
          ),
        ));
  }

  Widget _buildRecipeIngredient(String ingredient) {
    return Padding(padding: const EdgeInsets.all(5), child: Text(ingredient));
  }
}

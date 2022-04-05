import 'dart:io';

import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';

class IngredientsView extends StatelessWidget {
  final List<String> ingredients;
  IngredientsView(this.ingredients);
  List<List<String>> ingredientSplitter(arr, numberOfArrs) {
    List<int> sumOfArrs = List<int>.filled(numberOfArrs, 0);
    List<List<String>> returnList = List.generate(numberOfArrs, (i) => []);
    arr.sort((String a, String b) => a.compareTo(b));
    for (String str in arr) {
      int lowestIndex = 0;
      for (int index = 0; index < sumOfArrs.length - 1; index++) {
        if (sumOfArrs[index] < sumOfArrs[index + 1]) {
          lowestIndex = index;
        } else {
          lowestIndex = index + 1;
        }
      }
      returnList[lowestIndex].add(str);
      sumOfArrs[lowestIndex] += str.length;
    }
    return returnList;
  }

  List<Widget> ingredientColumnTextBoxes(numberOfBoxes) {
    List<List<String>> formattedIngredients =
        ingredientSplitter(ingredients, numberOfBoxes);

    List<Widget> returnWidgets = [];
    for (int index = 0; index < formattedIngredients.length; index++) {
      returnWidgets.add(Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            formattedIngredients[index].map(buildIngredientTextBox).toList(),
      )));
    }
    return returnWidgets;
  }

  Widget buildIngredientTextBox(temp) {
    return Padding(
        padding: EdgeInsets.only(bottom: 2, left: 1, right: 3),
        child: Text("> $temp"));
  }

  @override
  Widget build(BuildContext context) {
    final String formattedIngredients;
    return Column(children: [
      Text(
        "Ingredients:",
        style: Theme.of(context).textTheme.headline5,
      ),
      ExpandChild(
          collapsedHint: "Ingredients",
          expandedHint: "temp",
          child: Row(children: ingredientColumnTextBoxes(2)))
    ]);
  }
}

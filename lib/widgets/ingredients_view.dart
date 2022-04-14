import 'package:flutter/material.dart';

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
        padding: EdgeInsets.only(bottom: 0, left: 2, right: 2, top: 1),
        child: Text("> $temp",
            style: TextStyle(
              fontSize: 15,
              foreground: Paint()
                ..style = PaintingStyle.fill
                ..color = Colors.white,
            )));
  }

  @override
  Widget build(BuildContext context) {
    final String formattedIngredients;
    return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 15),
        child: Column(children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Ingredients:",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),

          Row(children: ingredientColumnTextBoxes(2)),
          // ExpandChild(
          //     collapsedHint: "PLEASE WORK",
          //     expandedHint: "temp",
          //     icon: Icons.cookie_sharp,
          //     child: Row(children: ingredientColumnTextBoxes(2)))
        ]));
  }
}
// Padding(
//                                 padding: EdgeInsets.only(
//                                     top: 5, bottom: 5, left: 15),
//                                 child: ),
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

  Widget ingredientTextBoxes(numberOfBoxes) {
    throw ("stop");
  }

  @override
  Widget build(BuildContext context) {
    final String formattedIngredients;
    return ExpandChild(
      child: Row(children: []),
    );
    // ExpandChild()
  }
}


// ListView.builder(
//                 itemCount: ingredients.length,
//                 //scrollDirection: Axis.horizontal,
//                 itemBuilder: (context, index) => Container(
//                     //margin: EdgeInsets.all(1),
//                     child: Card(
//                         child: Padding(
//                             padding: EdgeInsets.all(3),
//                             child: Center(
//                               child: Text(
//                                 ingredients[index],
//                               ),
//                             )))))
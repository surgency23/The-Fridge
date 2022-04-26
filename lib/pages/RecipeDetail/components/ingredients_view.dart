import 'package:flutter/material.dart';

class IngredientsView extends StatefulWidget {
  IngredientsView({Key? key, required this.ingredients}) : super(key: key);
  List<String> ingredients;
  @override
  State<IngredientsView> createState() => _IngredientsViewState();
}

class _IngredientsViewState extends State<IngredientsView> {
  Map<String, bool> _map = {};
  Map<String, bool> mapper(ingredients) {
    final Map<String, bool> _map = {};
    for (String ingredient in ingredients) {
      _map[ingredient] = false;
    }
    return _map;
  }

  @override
  void initState() {
    super.initState();
    _map = mapper(widget.ingredients);
  }

  @override
  Widget build(BuildContext context) {
    bool _customTileExpanded = true;
    return ExpansionTile(
      controlAffinity: ListTileControlAffinity.leading,
      initiallyExpanded: true,
      title: Text(
        "Ingredients",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      children: _map.keys
          .map((key) => CheckboxListTile(
                value: _map[key],
                onChanged: (value) => setState(() => _map[key] = value!),
                subtitle: Text(key),
              ))
          .toList(),
    );
  }
}


// class IngredientsView extends StatelessWidget {
//   final Map<String, bool> _map = {};
//   // List<List<String>> ingredientSplitter(arr, numberOfArrs) {
//   //   List<int> sumOfArrs = List<int>.filled(numberOfArrs, 0);
//   //   List<List<String>> returnList = List.generate(numberOfArrs, (i) => []);
//   //   arr.sort((String a, String b) => a.compareTo(b));
//   //   for (String str in arr) {
//   //     int lowestIndex = 0;
//   //     for (int index = 0; index < sumOfArrs.length - 1; index++) {
//   //       if (sumOfArrs[index] < sumOfArrs[index + 1]) {
//   //         lowestIndex = index;
//   //       } else {
//   //         lowestIndex = index + 1;
//   //       }
//   //     }
//   //     returnList[lowestIndex].add(str);
//   //     sumOfArrs[lowestIndex] += str.length;
//   //   }
//   //   return returnList;
//   // }

//   // List<Widget> ingredientColumnTextBoxes(numberOfBoxes) {
//   //   List<List<String>> formattedIngredients =
//   //       ingredientSplitter(ingredients, numberOfBoxes);

//   //   List<Widget> returnWidgets = [];
//   //   for (int index = 0; index < formattedIngredients.length; index++) {
//   //     returnWidgets.add(Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children:
//   //           formattedIngredients[index].map(buildIngredientTextBox).toList(),
//   //     ));
//   //   }
//   //   return returnWidgets;
//   // }

//   Widget buildIngredientTextBox(temp) {
//     return Text(temp,
//         style: TextStyle(
//             fontSize: 15, foreground: Paint()..style = PaintingStyle.fill));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: const 
// Text(
//         "Ingredients",
//         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//       ),
//       children: ingredients.map(buildIngredientTextBox).toList(),
//     );
//   }
// }
// // Column(children: [
// //           Row(children: ingredientColumnTextBoxes(2)),
// //         ]
// //       )
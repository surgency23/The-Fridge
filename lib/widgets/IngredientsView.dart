import 'package:flutter/material.dart';
import 'package:expand_widget/expand_widget.dart';

class IngredientsView extends StatelessWidget {
  final List<String> ingredients;
  IngredientsView(this.ingredients);

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
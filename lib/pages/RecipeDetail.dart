import "../modules/recipe.dart";
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "dart:math";

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: SafeArea(
            child: Card(
          color: Color.fromARGB(255, 34, 76, 108),
          child: ListView(children: [staggeredGrid(recipe)]),
        )));
  }

  Widget staggeredGrid(_recipe) {
    return StaggeredGrid.count(
      crossAxisCount: 6,
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
      children: [
        StaggeredGridTile.count(
          mainAxisCellCount: 4,
          crossAxisCellCount: 3,
          child: Card(
              child: Image.network(
                  'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  fit: BoxFit.contain)),
        ),
        StaggeredGridTile.fit(
          crossAxisCellCount: 2,
          child: Card(
              child: Text(
                  "hgjefnsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbk")),
        ),
        StaggeredGridTile.fit(
            crossAxisCellCount: 1,
            child: Card(
                child: Text(
                    "hgjefnsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbknsfmlvdjknsuhbdjshgjefkdaslsfhbk"))),

        ///need to figire out this shit next
        StaggeredGridTile.fit(
            crossAxisCellCount: 5,
            child: Card(
              child: ListView.builder(
                itemCount: _recipe.ingredients.length,
                itemBuilder: (context, index) {
                  return Text(_recipe.ingredients[index]);
                },
              ),
            )),
      ],
    );
  }

  Widget gridRecipeInfo(double numberPadding, _recipe, double gridPadding) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Flexible(
          child: GridView(
        padding: EdgeInsets.all(gridPadding),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: gridPadding,
          crossAxisSpacing: gridPadding,
        ),
        children: [
          Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Cook Time: ${_recipe.cooktime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Prep Time: ${_recipe.preptime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Wait Time: ${_recipe.waittime.toString()}")),
              Padding(
                  padding: EdgeInsets.all(numberPadding),
                  child: Text("Servings: ${_recipe.servings.toString()}")),
            ],
          )),
          Card(
              child: Padding(
            child: Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                fit: BoxFit.contain),
            padding: EdgeInsets.all(numberPadding),
          )),
        ],
      )),
      Flexible(
          child: Card(
        child: ListView.builder(
          itemCount: _recipe.ingredients.length,
          itemBuilder: (context, index) {
            return Text(_recipe.ingredients[index]);
          },
        ),
      ))
    ]);
  }
}

Widget _buildIngredient(String ingredient) {
  return Padding(
      padding: const EdgeInsets.all(5),
      child: ListTile(
        title: Text(ingredient),
      ));
}

//MUST BUILD AREA FOR INGREDIENTS AND PROCESS
//        ListView.builder(
//   itemCount: _recipe.ingredients.length,
//   itemBuilder: (context, index) {
//     return ListTile(
//       title: Text(_recipe.ingredients[index]),
//     );
//   },
// ),
// Card()

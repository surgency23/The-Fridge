import "../modules/recipe.dart";
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: SafeArea(
            child: Card(
          color: Colors.blue,
          child: test(recipe),
        )));
  }

  Widget test(_recipe) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Card(
              color: Color.fromARGB(255, 31, 9, 82),
              child: Text("Cook Time: ${_recipe.cooktime.toString()}")),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 1,
          mainAxisCellCount: 1,
          child: Card(
              color: Colors.yellow,
              child: Text("Cook Time: ${_recipe.cooktime.toString()}")),
        ),
        StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 2,
            child: Card(
                color: Colors.pink,
                child: Text("Cook Time: ${_recipe.cooktime.toString()}"))),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 1,
          child: Card(
              color: Color.fromARGB(255, 85, 79, 81),
              child: Text("Cook Time: ${_recipe.cooktime.toString()}")),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 4,
          mainAxisCellCount: 2,
          child: Card(
              color: Color.fromARGB(255, 43, 155, 61),
              child: Text("Cook Time: ${_recipe.cooktime.toString()}")),
        ),
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
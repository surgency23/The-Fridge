import 'package:flutter/material.dart';
import '../../../classes/recipe.dart';
import '../../RecipeDetail/recipe_detail.dart';

class RecipeFound extends StatelessWidget {
  const RecipeFound(this.recipe, {Key? key}) : super(key: key);
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RecipeDetail(recipe: recipe)));
        },
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(recipe.image.size640W))),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:the_fridge/pages/Home/components/recipe_gridview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const RecipeGridView();
  }
}

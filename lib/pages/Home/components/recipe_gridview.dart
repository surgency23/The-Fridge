import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/classes/recipe.dart';
import 'package:the_fridge/controllers/theme_controller/theme_controller.dart';
import 'recipe_found.dart';

class RecipeGridView extends StatefulWidget {
  const RecipeGridView({Key? key}) : super(key: key);
  @override
  _RecipeGridViewState createState() => _RecipeGridViewState();
}

class _RecipeGridViewState extends State<RecipeGridView> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset >=
          (scrollController.position.maxScrollExtent)) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
        builder: (context, ThemeController themeNotifier, child) {
      return SafeArea(
          child: RefreshIndicator(
              onRefresh: () async {
                //location to grab initial load of recipes
              },
              child: CustomScrollView(
                physics: const ScrollPhysics(),
                controller: scrollController,
                slivers: [
                  SliverAppBar(
                    // Provide a standard title.
                    title: const Text("The Fridge"),
                    centerTitle: false,
                    // Allows the user to reveal the app bar if they begin scrolling
                    // back up the list of items.
                    floating: true,
                    forceElevated: true,
                    elevation: 10,
                    actions: [
                      IconButton(
                          icon: Icon(themeNotifier.isDark
                              ? Icons.nightlight_round
                              : Icons.wb_sunny),
                          onPressed: () {
                            themeNotifier.isDark
                                ? themeNotifier.isDark = false
                                : themeNotifier.isDark = true;
                          })
                    ],
                  ),
                  recipeSliver(),
                ],
              )));
    });
  }

  SliverGrid recipeSliver() {
    return SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          /*location to return statemanaged recipe data*/
          return RecipeFound(Recipe(
              tags: [],
              servings: "servings",
              recipeSource: "recipeSource",
              imageSource: "imageSource",
              image: RecipeImage("size120W", null, null, "size640W", null,
                  "size1280W", null, null, null),
              instructions: "instructions",
              ingredients: ["ingredients"],
              title: "title",
              id: "id"));
        },
        childCount: 0 /*location to return statemanaged total recipes*/,
      ),
    );
  }
}

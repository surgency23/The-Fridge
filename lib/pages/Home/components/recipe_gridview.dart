import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/classes/recipe.dart';
import 'package:the_fridge/controllers/theme_controller/theme_controller.dart';
import 'package:the_fridge/controllers/recipe_controller/recipe_controller.dart';
import 'package:the_fridge/pages/Home/components/recipe_loading.dart';
import 'recipe_found.dart';

class RecipeGridView extends StatefulWidget {
  const RecipeGridView({Key? key}) : super(key: key);
  @override
  _RecipeGridViewState createState() => _RecipeGridViewState();
}

class _RecipeGridViewState extends State<RecipeGridView> {
  ScrollController scrollController = ScrollController();
  final RecipeController recipeController = RecipeController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScrollUpdated);
    recipeController.loadRecipes();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> onScrollUpdated() async {
    var maxScroll = scrollController.position.maxScrollExtent;
    var currentPosition = scrollController.position.pixels;
    if (currentPosition == maxScroll) {
      recipeController.loadRecipes();
    }
  }

  void scrollUp() {
    scrollController.jumpTo(0);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: RefreshIndicator(
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
                  Consumer<ThemeController>(
                      builder: (context, ThemeController themeNotifier, child) {
                    return IconButton(
                        icon: Icon(themeNotifier.isDark
                            ? Icons.nightlight_round
                            : Icons.wb_sunny),
                        onPressed: () {
                          themeNotifier.isDark
                              ? themeNotifier.isDark = false
                              : themeNotifier.isDark = true;
                        });
                  }),
                ],
              ),
              ChangeNotifierProvider.value(
                  value: recipeController,
                  child: Consumer<RecipeController>(
                    builder: (_, ctl, __) {
                      if (recipeController.isLoading) {
                        print("loading");
                        return recipesLoadingShimmer(recipeController.recipes);
                      } else {
                        print("done loading");
                        return recipeSliver(recipeController.recipes);
                      }
                    },
                  )),

              //recipeSliver(),
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: scrollUp,
      ),
    ));
  }

  SliverGrid recipeSliver(List<Recipe> recipes) {
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
          return RecipeFound(recipes[index]);
        },
        childCount: recipeController.recipes.length,
      ),
    );
  }

  SliverGrid recipesLoadingShimmer(List<Recipe> recipes) {
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
          return RecipeLoading();
        },
        childCount: recipes.length + 30,
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

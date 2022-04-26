import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/classes/recipe.dart';
import 'package:the_fridge/controllers/theme_controller/theme_controller.dart';
import 'package:the_fridge/controllers/recipe_controller/recipe_controller.dart';
import 'recipe_found.dart';

class RecipeGridView extends StatefulWidget {
  const RecipeGridView({
    Key? key,
  }) : super(key: key);
  @override
  _RecipeGridViewState createState() => _RecipeGridViewState();
}

class _RecipeGridViewState extends State<RecipeGridView> {
  ScrollController scrollController = ScrollController();
  final RecipeController recipeController = RecipeController();
  double scrollOpacity = 1.0;
  int duration = 0;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(onScrollUpdated);
    scrollController.addListener(floatingActionButtonOpacity);
    recipeController.loadRecipes();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future<void> floatingActionButtonOpacity() async {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        duration = 500;
        scrollOpacity = 0;
      });
    } else {
      setState(() {
        duration = 0;
        scrollOpacity = 1;
        isVisible = true;
      });
    }
    if (scrollController.position.atEdge &&
        scrollController.position.pixels == 0) {
      setState(() {
        duration = 500;
        scrollOpacity = 0;
      });
    }
  }

  Future<void> onScrollUpdated() async {
    var maxScroll = (scrollController.position.maxScrollExtent) * .80;
    var currentPosition = scrollController.position.pixels;
    if (currentPosition >= maxScroll && recipeController.isLoading == false) {
      print("loading");
      await recipeController.loadRecipes();
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
            await recipeController.reloadRecipes();
          },
          child: CustomScrollView(
            physics: const ScrollPhysics(),
            controller: scrollController,
            slivers: [
              appBarSliver(),
              ChangeNotifierProvider.value(
                  value: recipeController,
                  child: Consumer<RecipeController>(
                    builder: (_, ctl, __) {
                      return recipeSliver(recipeController.recipes);
                    },
                  )),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return const LinearProgressIndicator();
                  },
                  childCount: 1,
                ),
              )
            ],
          )),
      floatingActionButton: AnimatedOpacity(
          opacity: scrollOpacity,
          duration: Duration(milliseconds: duration),
          onEnd: () {
            if (scrollOpacity == 0) {
              isVisible = false;
            }
          },
          child: Visibility(
              visible: isVisible,
              child: FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () {
                  scrollUp();
                },
              ))),
    ));
  }

  Widget appBarSliver() {
    return SliverAppBar(
      // Provide a standard title.
      snap: true,
      title: const Text("The Fridge"),
      centerTitle: false,
      // Allows the user to reveal the app bar if they begin floatingActionButtonOpacity
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
    );
  }

  SliverGrid recipeSliver(List<Recipe> recipes) {
    return SliverGrid(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 2,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        //repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) =>
            RecipeFound(recipes[index], index, recipes[index].image.size1280W),
        childCount: recipeController.recipes.length,
      ),
    );
  }
}

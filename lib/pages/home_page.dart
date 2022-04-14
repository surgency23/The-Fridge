import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import "../classes/recipe.dart";
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import "recipe_detail.dart";
import "../main.dart";

Future<List<Recipe>> fetchRecipes() async {
  final response =
      await rootBundle.loadString('lib/test_data/bonAppetite.json');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRecipes, response);
}

// A function that converts a response body into a List<Photo>.
List<Recipe> parseRecipes(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unrelated_type_equality_checks
  bool isDark = ThemeMode.dark == true ? true : false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An Error Occured loading data!"),
            );
          } else if (snapshot.hasData) {
            return RecipeList(
              recipes: snapshot.data!,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: IconButton(
          icon: isDark == true
              ? const Icon(Icons.sunny)
              : const Icon(Icons.mode_night_outlined),
          onPressed: () {
            setState(() {
              // Here we changing the icon.
              isDark = !isDark;
              if (isDark == false) {
                MyApp.of(context)?.changeTheme(ThemeMode.light);
              } else {
                MyApp.of(context)?.changeTheme(ThemeMode.dark);
              }
            });
          }),
    ));
  }

  // Widget _buildRecipePageList(Recipe recipe) {
  //   return Padding(
  //       padding: const EdgeInsets.all(5),
  //       child: ListTile(
  //         title: Text(recipe.title),
  //         onTap: () async {
  //           Navigator.push(
  //               context,
  //               MaterialPageRoute(
  //                   builder: (context) => RecipeDetail(recipe: recipe)));
  //         },
  //       ));
  //}
}

class RecipeList extends StatelessWidget {
  const RecipeList({Key? key, required this.recipes}) : super(key: key);
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    int swapindex = 0;
    NetworkImage defineSize(int index) {
      if (index == 0) {
        swapindex += 7;
        return NetworkImage(recipes[index].image!.size320W!);
      } else if (index % 10 == 0) {
        swapindex += 7;
        return NetworkImage(recipes[index].image!.size320W!);
      } else if ((index - 7) % 10 == 0) {
        swapindex += 3;
        return NetworkImage(recipes[index].image!.size320W!);
      } else {
        return NetworkImage(recipes[index].image!.size120W!);
      }
    }

    return Container(
        //margin: EdgeInsets.all(12),
        child: GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
      semanticChildCount: recipes.length,
      childrenDelegate:
          SliverChildBuilderDelegate((context, index) => GestureDetector(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RecipeDetail(recipe: recipes[index])));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover, image: defineSize(index))),
                ),
              )),
    ));
  }
}

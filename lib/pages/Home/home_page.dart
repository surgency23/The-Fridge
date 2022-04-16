import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:the_fridge/pages/Login/login_page.dart';
import '../../classes/recipe.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../RecipeDetail/recipe_detail.dart';
import '../../main.dart';

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
  const HomePage({Key? key}) : super(key: key);

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
        title: const Text('The Fridge'),
      ),
      body: FutureBuilder<List<Recipe>>(
        future: fetchRecipes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            // print(snapshot);
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
      drawer: Drawer(
          child: Column(
        children: [
          ElevatedButton(
              child: const Text("login"),
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              })
        ],
      )),
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
}

class RecipeList extends StatelessWidget {
  const RecipeList({Key? key, required this.recipes}) : super(key: key);
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          const QuiltedGridTile(2, 2),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
          const QuiltedGridTile(1, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
          (context, index) => GestureDetector(
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
                          fit: BoxFit.cover,
                          image: NetworkImage(recipes[index].image.size640W))),
                ),
              ),
          childCount: recipes.length),
    );
  }
}

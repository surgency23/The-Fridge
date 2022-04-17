import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:the_fridge/pages/Login/login_page.dart';
import '../../classes/recipe.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../RecipeDetail/recipe_detail.dart';

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
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 700),
        backgroundColor: Colors.blue,
        height: 45.5,
        items: const <Widget>[
          Icon(Icons.home, size: 18.5),
          Icon(Icons.account_circle_rounded, size: 18.5),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    ));
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList({Key? key, required this.recipes}) : super(key: key);
  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverAppBar(
        // Provide a standard title.
        title: Text("The Fridge"),
        centerTitle: false,
        // Allows the user to reveal the app bar if they begin scrolling
        // back up the list of items.
        floating: true,
        forceElevated: true,
        elevation: 10,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.sunny))],
        // Display a placeholder widget to visualize the shrinking size.
        //flexibleSpace: Placeholder(),
        // Make the initial height of the SliverAppBar larger than normal.
        //expandedHeight: 50,
      ),
      SliverGrid(
        delegate: SliverChildBuilderDelegate(
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
                            image:
                                NetworkImage(recipes[index].image.size640W))),
                  ),
                ),
            childCount: recipes.length),
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
      )
    ]);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Floating App Bar';

    return MaterialApp(
      title: title,
      home: Scaffold(
        // No appbar provided to the Scaffold, only a body with a
        // CustomScrollView.
        body: CustomScrollView(
          slivers: [
            // Add the app bar to the CustomScrollView.
            const SliverAppBar(
              // Provide a standard title.
              title: Text(title),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Placeholder(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 200,
            ),
            // Next, create a SliverList
            SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 1000,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// IconButton(
//           icon: isDark == true
//               ? const Icon(Icons.sunny)
//               : const Icon(Icons.mode_night_outlined),
//           onPressed: () {
//             setState(() {
//               // Here we changing the icon.
//               isDark = !isDark;
//               if (isDark == false) {
//                 MyApp.of(context)?.changeTheme(ThemeMode.light);
//               } else {
//                 MyApp.of(context)?.changeTheme(ThemeMode.dark);
//               }
//             });
//           }),

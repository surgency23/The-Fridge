import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_fridge/pages/Login/login_page.dart';
import '../../classes/recipe.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../../main.dart';
import '../RecipeDetail/recipe_detail.dart';
import '../SignupLoginSplashScreen/login_splash_screen.dart';

Future<List<Recipe>> fetchRecipes() async {
  final response =
      await rootBundle.loadString('assets/test_data/bonAppetite.json');

  // Use the compute function to run parsePhotos in a separate isolate.
  return compute(parseRecipes, response);
}

// A function that converts a response body into a List<Recipe>.

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unrelated_type_equality_checks
  bool isDark = ThemeMode.dark == true ? true : false;
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> pages = [HomePage(), WelcomeScreen()];
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
            return CustomScrollView(slivers: [
              SliverAppBar(
                // Provide a standard title.
                title: const Text("The Fridge"),
                centerTitle: false,
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                floating: true,
                forceElevated: true,
                elevation: 5,
                actions: [
                  IconButton(
                      icon: isDark == true
                          ? const Icon(Icons.wb_sunny_rounded)
                          : const Icon(Icons.mode_night_rounded),
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
                ],
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
                                    builder: (context) => RecipeDetail(
                                        recipe: snapshot.data![index])));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        snapshot.data![index].image.size640W))),
                          ),
                        ),
                    childCount: snapshot.data!.length),
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
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: Duration(milliseconds: 400),
        //color: isDark == true ? Colors.black : Colors.white,
        backgroundColor: Colors.blue,
        height: 45.5,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
        ],
        onTap: (index) async {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => pages[index]));
        },
      ),
    ));
  }
}

// class RecipeList extends StatelessWidget {
//   const RecipeList({Key? key, required this.recipes}) : super(key: key);
//   final List<Recipe> recipes;

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = ThemeMode.dark == true ? true : false;
//     return CustomScrollView(slivers: [
//       SliverAppBar(
//         // Provide a standard title.
//         title: Text("The Fridge"),
//         centerTitle: false,
//         // Allows the user to reveal the app bar if they begin scrolling
//         // back up the list of items.
//         floating: true,
//         forceElevated: true,
//         elevation: 10,
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: isDark == true
//                 ? const Icon(Icons.sunny)
//                 : const Icon(Icons.mode_night_outlined),
//           )
//         ],
//         // Display a placeholder widget to visualize the shrinking size.
//         //flexibleSpace: Placeholder(),
//         // Make the initial height of the SliverAppBar larger than normal.
//         //expandedHeight: 50,
//       ),
//       SliverGrid(
//         delegate: SliverChildBuilderDelegate(
//             (context, index) => GestureDetector(
//                   onTap: () async {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) =>
//                                 RecipeDetail(recipe: recipes[index])));
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             fit: BoxFit.cover,
//                             image:
//                                 NetworkImage(recipes[index].image.size640W))),
//                   ),
//                 ),
//             childCount: recipes.length),
//         gridDelegate: SliverQuiltedGridDelegate(
//           crossAxisCount: 4,
//           mainAxisSpacing: 4,
//           crossAxisSpacing: 4,
//           repeatPattern: QuiltedGridRepeatPattern.inverted,
//           pattern: [
//             const QuiltedGridTile(2, 2),
//             const QuiltedGridTile(1, 1),
//             const QuiltedGridTile(1, 1),
//             const QuiltedGridTile(1, 1),
//             const QuiltedGridTile(1, 1),
//           ],
//         ),
//       )
//     ]);
//   }
// }

//prebuilt packages
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
//flutter packages
import 'package:flutter/material.dart';
import 'package:the_fridge/pages/Home/components/recipe_gridview.dart';
//project code packages

import '../../classes/recipe.dart';
import '../../main.dart';
import '../../utils/parse_json.dart';
import '../RecipeDetail/recipe_detail.dart';
import '../SignupLoginSplashScreen/login_splash_screen.dart';
import '../Login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const RecipeGridView(),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 400),
        //color: isDark == true ? Colors.black : Colors.white,
        backgroundColor: Colors.blue,
        height: 45.5,
        items: const <Widget>[
          Icon(
            Icons.home,
            color: Colors.black,
          ),
          Icon(
            Icons.account_circle_rounded,
            color: Colors.black,
          ),
        ],
        onTap: (index) {},
      ),
    );
  }
}


// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   // ignore: unrelated_type_equality_checks
//   bool isDark = ThemeMode.dark == true ? true : false;

//   @override
//   void innitState() {}

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       body: FutureBuilder<List<Recipe>>(
//         future: fetchRecipes(""),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             print(snapshot);
//             return const Center(
//               child: Text("An Error Occured loading data!"),
//             );
//           } else if (snapshot.hasData) {
//             return CustomScrollView(slivers: [
//               SliverGrid(
//                 delegate: SliverChildBuilderDelegate(
//                     (context, index) => GestureDetector(
//                           onTap: () async {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => RecipeDetail(
//                                         recipe: snapshot.data![index])));
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                     fit: BoxFit.cover,
//                                     image: NetworkImage(
//                                         snapshot.data![index].image.size640W))),
//                           ),
//                         ),
//                     childCount: snapshot.data!.length),
//                 gridDelegate: SliverQuiltedGridDelegate(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 4,
//                   crossAxisSpacing: 4,
//                   repeatPattern: QuiltedGridRepeatPattern.inverted,
//                   pattern: [
//                     const QuiltedGridTile(2, 2),
//                     const QuiltedGridTile(1, 1),
//                     const QuiltedGridTile(1, 1),
//                     // const QuiltedGridTile(1, 1),
//                     // const QuiltedGridTile(1, 1),
//                   ],
//                 ),
//               )
//             ]);
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         animationDuration: Duration(milliseconds: 400),
//         //color: isDark == true ? Colors.black : Colors.white,
//         backgroundColor: Colors.blue,
//         height: 45.5,
//         items: <Widget>[
//           Icon(
//             Icons.home,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.account_circle_rounded,
//             color: Colors.black,
//           ),
//         ],
//         onTap: (index) {},
//       ),
//     ));
//   }
// }

// class TitleBar extends StatefulWidget {
//   const TitleBar({Key? key, required bool isDark, required String title}) : super(key: key);

//   @override
//   State<TitleBar> createState() => _TitleBarState();
// }

// class _TitleBarState extends State<TitleBar> {
//   bool isDark = ThemeMode.dark == true ? true : false;
//   @override
//   Widget build(BuildContext context) {
//     return 
// SliverAppBar(
//       // Provide a standard title.
//       title: const Text(title),
//       centerTitle: false,
//       // Allows the user to reveal the app bar if they begin scrolling
//       // back up the list of items.
//       floating: true,
//       forceElevated: true,
//       elevation: 5,
//       actions: [
//         IconButton(
//             icon: isDark == true
//                 ? const Icon(Icons.wb_sunny_rounded)
//                 : const Icon(Icons.mode_night_rounded),
//             onPressed: () {
//               setState(() {
//                 // Here we changing the icon.
//                 isDark = !isDark;
//                 if (isDark == false) {
//                   MyApp.of(context)?.changeTheme(ThemeMode.light);
//                 } else {
//                   MyApp.of(context)?.changeTheme(ThemeMode.dark);
//                 }
//               });
//             }),
//       ],
//     );
//   }
// }

// class RecipeList extends StatelessWidget {
//   const RecipeList({Key? key, required this.recipes}) : super(key: key);
//   final List<Recipe> recipes;

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = ThemeMode.dark == true ? true : false;
//     return CustomScrollView(slivers: [
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

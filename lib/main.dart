import 'package:flutter/material.dart';
import "../modules/recipe.dart";
import 'test_data/test_recipes.dart';
import "../pages/RecipeDetail.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

  /// ↓↓ ADDED
  /// InheritedWidget style accessor to our State object.
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

/// State object hidden ↓. Focusing on ↑ StatefulWidget here.

class _MyAppState extends State<MyApp> {
  /// 1) our themeMode "state" field
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      home: const MyHomePage(title: 'The Fridge'),
    );
  }

  /// 3) Call this to change theme from any context using "of" accessor
  /// e.g.:
  /// MyApp.of(context).changeTheme(ThemeMode.dark);
  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isDark = ThemeMode.dark == true ? true : false;
  int _selectedIndex = 0;

  final List<Recipe> _recipes = recipes;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        //data display section
        child: ListView(children: _recipes.map(_buildRecipePageList).toList()),
      ),
      //
    );
  }

  Widget _buildRecipePageList(Recipe recipe) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          title: Text(recipe.title),
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeDetail(recipe: recipe)));
          },
        ));
  }
}

/***
 * IconButton(
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
 */
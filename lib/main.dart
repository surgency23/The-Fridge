import 'package:flutter/material.dart';
import "../modules/recipe.dart";
import 'test_data/test_recipes.dart';
import "../pages/RecipeDetail.dart";
import 'package:url_launcher/url_launcher.dart';

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
      title: 'Flutter Demo',
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
  bool isDark = false;
  final List<Recipe> _recipes = recipes;
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
      drawer: Drawer(
        child: Column(
          //this is the toggle light dark theme and set on the bottom part of the page.
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// //////////////////////////////////////////////////////
                /// Change theme & rebuild via this switch\
                /// will not require authentication to do this but this Drawer will have authentication area within it
                ///
                const Text(
                  'Light/Dark Mode:',
                ),
                Switch(
                    value: isDark,
                    onChanged: (value) {
                      setState(() {
                        isDark = value;
                        if (isDark == false) {
                          MyApp.of(context)?.changeTheme(ThemeMode.light);
                        } else {
                          MyApp.of(context)?.changeTheme(ThemeMode.dark);
                        }
                      });
                    }),
              ],
            ),
          ],
        ),
      ),
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

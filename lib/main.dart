import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/theme_controller/theme_controller.dart';
import 'pages/Home/home_page.dart';

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
    return ChangeNotifierProvider(
        create: (_) => ThemeController(),
        child: Consumer<ThemeController>(
          builder: ((context, ThemeController themeNotifier, child) {
            return MaterialApp(
              title: "The Fridge",
              theme:
                  themeNotifier.isDark ? ThemeData.dark() : ThemeData.light(),
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
            );
          }),
        ));
  }
}

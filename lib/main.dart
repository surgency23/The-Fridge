import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_fridge/widgets/custom_bottom_nav_bar.dart';
import 'controllers/theme_controller/theme_controller.dart';
import 'controllers/user_controller/user_controller.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => User())],
      child: const MyApp()));
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
                home: const PreservingBottomNavState());
          }),
        ));
  }
}

import "../modules/recipe.dart";
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail({Key? key, required this.recipe}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //background image
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(.25), BlendMode.darken),
                    image: const NetworkImage(
                        "https://512pixels.net/downloads/macos-wallpapers-6k/10-11-6k.jpg"))),
          ),
        ),
        //close button
        Positioned(
          top: 15,
          right: 15,
          child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        //where the actual information lives
        Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Container(
                height: MediaQuery.of(context).size.height / 1.25,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: .15),
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white.withOpacity(.275)),
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.red, width: 2)
                          ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 10, right: 5, left: 5),
                        child: Text(recipe.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      decoration: BoxDecoration(
                          //border: Border.all(color: Colors.red, width: 2)
                          ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 20,
                          ),
                          SizedBox(width: 7),
                          Text("RATINGS PLACEHOLDER"),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2)),
                      child: GridView.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 1,
                          crossAxisSpacing: 1,
                          shrinkWrap: true,
                          childAspectRatio: 12,
                          children: List.generate(recipe.ingredients.length,
                              (ingredient) {
                            return Row(children: [
                              Expanded(
                                child: Text(recipe.ingredients[ingredient],
                                    style: TextStyle(
                                      fontSize: 15,
                                      foreground: Paint()
                                        ..style = PaintingStyle.fill
                                        ..color = Colors.white,
                                    )),
                              )
                            ]);
                          })),
                    ),
                    Container(
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.red, width: 2)
                            ),
                        child: const Padding(
                            padding:
                                EdgeInsets.only(top: 5, bottom: 5, left: 15),
                            child: Text("Instructions:",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)))),
                    Container(
                        decoration: BoxDecoration(
                            //border: Border.all(color: Colors.red, width: 2)
                            ),
                        child: Padding(
                            padding: EdgeInsets.only(left: 30, right: 30),
                            child: Text(recipe.instructions,
                                style: TextStyle(
                                  fontSize: 15,
                                  foreground: Paint()
                                    ..style = PaintingStyle.fill
                                    ..color = Colors.white,
                                ))))
                  ],
                ))))
      ],
    ));
  }
}
                        // children: List.generate(
                        //   recipe.ingredients.length,
                        //   (f) {
                        //     return Row(
                        //       children: <Widget>[
                        //         Flexible(
                        //             child: Text(
                        //           "${recipe.ingredients[f]}",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 15,
                        //           ),
                        //         )),
                        //       ],
                        //     );
                        //   },
                        // ),
import './components/ingredients_view.dart';
import './components/ratings_view.dart';
import './components/instructions_view.dart';
import '../../classes/recipe.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(
      {Key? key, required this.recipe, required this.tag, required this.image})
      : super(key: key);
  final Recipe recipe;
  final int tag;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(recipe.title)),
        body: CustomScrollView(slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Hero(
                  tag: tag,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: image,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Transform.scale(
                      scale: 0.25,
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
              Container(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: const RatingsView()),
                  recipe.servings != null
                      ? Container(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(recipe.servings!))
                      : Container(),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: IngredientsView(
                        ingredients: recipe.ingredients,
                      )),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: InstructionsView(recipe.instructions)),
                ],
              )))
            ]),
          )
        ]));
  }
  //       Stack(
  //         children: [
  //           //background image
  //           Positioned.fill(
  //             child: Container(
  //               decoration: BoxDecoration(
  //                   image: DecorationImage(
  //                       fit: BoxFit.cover,
  //                       colorFilter: ColorFilter.mode(
  //                           Colors.black.withOpacity(.50), BlendMode.darken),
  //                       image: NetworkImage(recipe.image.size1280W))),
  //             ),
  //           ),
  //           //where the actual information lives
  //           Positioned(
  //               top: 10,
  //               left: 10,
  //               right: 10,
  //               bottom: 10,
  //               child: Container(
  //                   decoration: BoxDecoration(
  //                       border: Border.all(color: Colors.black, width: .15),
  //                       borderRadius: BorderRadius.circular(15.0),
  //                       color: Colors.black.withOpacity(0.5)),
  //                   child: SingleChildScrollView(
  //                       child: Column(
  //                     mainAxisSize: MainAxisSize.max,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       Container(
  //                           padding: const EdgeInsets.only(top: 5, bottom: 5),
  //                           child: const RatingsView()),
  //                       recipe.servings != null
  //                           ? Container(
  //                               padding:
  //                                   const EdgeInsets.only(top: 5, bottom: 5),
  //                               child: Text(recipe.servings!))
  //                           : Container(),
  //                       Container(
  //                           alignment: Alignment.centerLeft,
  //                           child: IngredientsView(recipe.ingredients)),
  //                       Container(
  //                           alignment: Alignment.centerLeft,
  //                           child: InstructionsView(recipe.instructions)),
  //                     ],
  //                   )
  // )
  // )
  // )
  //         ],
  //       ));
  // }
}

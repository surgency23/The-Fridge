import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../classes/recipe.dart';
import '../../RecipeDetail/recipe_detail.dart';

class RecipeFound extends StatelessWidget {
  const RecipeFound(this.recipe, this.tag, this.image, {Key? key})
      : super(key: key);
  final Recipe recipe;
  final int tag;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RecipeDetail(
                  recipe: recipe,
                  image: image,
                  tag: tag,
                ),
              ));
        }),
        child: ClipRect(
          child: Hero(
              tag: tag,
              child: CachedNetworkImage(
                imageUrl: image,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Transform.scale(
                  scale: 0.25,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              )),
        ));
  }
  //   return GridTile(
  //       footer: GridTileBar(
  //         title: Center(child: Text(recipe.title)),
  //         backgroundColor: Colors.black.withOpacity(0.5),
  //       ),
  //       child: GestureDetector(
  //           onTap: () async {
  //             Navigator.push(
  //                 context,
  //                 MaterialPageRoute(
  //                     builder: (context) => RecipeDetail(recipe: recipe)));
  //           },
  //           child: CachedNetworkImage(
  //             imageUrl: recipe.image.size640W,
  //             progressIndicatorBuilder: (context, url, downloadProgress) =>
  //                 Transform.scale(
  //               scale: 0.25,
  //               child:
  //                   CircularProgressIndicator(value: downloadProgress.progress),
  //             ),
  //             errorWidget: (context, url, error) => Icon(Icons.error),
  //           )

  //           // DecorationImage(
  //           //     fit: BoxFit.cover,
  //           //     image: CachedNetworkImageProvider(recipe.image.size640W)
  //           // CachedNetworkImage(
  //           //   imageUrl: recipe.image.size640W,
  //           //   progressIndicatorBuilder:
  //           //       (context, url, downloadProgress) =>
  //           //           CircularProgressIndicator(
  //           //               value: downloadProgress.progress),
  //           //   errorWidget: (context, url, error) => Icon(Icons.error),
  //           // )
  //           // NetworkImage(
  //           //   recipe.image.size640W,
  //           // )
  //           ));
  // }
}

import 'package:the_fridge/services/recipeservice.dart';
import '../classes/recipe.dart';

Future<List<Recipe>> fetchRecipes(String lastId) async {
  final response = await RecipeService().requestRecipes(lastId);
  List<Recipe> returnData = [];
  for (var res in response["data"]) {
    Recipe temp = Recipe.fromJson(res);
    returnData.add(temp);
  }
  return returnData;
}

import '../classes/recipe.dart';
import 'dart:convert';

List<String> parseRecipeIds(String responseBody) {
  final parsed = jsonDecode(responseBody);
  final listOfIds = List<String>.from(parsed);
  return listOfIds;
}

Recipe parseRecipe(String responseBody) {
  final parsed = jsonDecode(responseBody);
  Recipe recipe = Recipe.fromJson(parsed);
  return recipe;
//   .cast<Map<String, dynamic>>();
//   parsed.map<Recipe>((json) => Recipe.fromJson(json)).toList();
//   throw UnimplementedError();
}

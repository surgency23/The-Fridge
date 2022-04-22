import 'package:flutter/foundation.dart';
import 'package:the_fridge/utils/parse_json.dart';
import '../../classes/recipe.dart';

class RecipeController with ChangeNotifier {
  bool isLoading = false;
  String lastId = "";
  List<Recipe> recipes = [];

  loadRecipes() async {
    isLoading = true;
    await addRecipes(lastId);
    lastId = recipes.last.id;
    isLoading = false;
    notifyListeners();
  }

  isLoadingNotifier() {
    notifyListeners();
  }

  isNotLoadingNotifier() {
    notifyListeners();
  }

  Future<void> addRecipes(String lastId) async {
    var response = await fetchRecipes(lastId);
    for (Recipe recipe in response) {
      recipes.add(recipe);
    }
  }
}

class Recipe {
  final List<String> tags;
  final String? servings;
  final String recipeSource;
  final String? imageSource;
  final RecipeImage image;
  final String instructions;
  final List<String> ingredients;
  final String title;
  final String id;
  final List<ParsedIngredients>? parsedIngredients;

  const Recipe(
      {required this.tags,
      required this.servings,
      required this.recipeSource,
      required this.imageSource,
      required this.image,
      required this.instructions,
      required this.ingredients,
      required this.title,
      required this.id,
      this.parsedIngredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var temp;
    if (json["parsedIngredients"] is List) {
      temp = json["parsedIngredients"] == null
          ? null
          : (json["parsedIngredients"] as List)
              .map((e) => ParsedIngredients.fromJson(e))
              .toList();
    }
    List<String> tags;
    String recipeSource;
    String? servings;
    String? imageSource;
    RecipeImage image;
    String instructions;
    List<String> ingredients;
    String title;
    String id = json["id"];
    try {
      tags = List<String>.from(json["tags"]);
    } catch (e) {
      print("tags");
      rethrow;
    }

    try {
      servings = json["servings"];
    } catch (e) {
      print("servings");
      rethrow;
    }

    try {
      recipeSource = json["recipeSource"];
    } catch (e) {
      print("recipeSource");
      rethrow;
    }
    try {
      imageSource = json["imageSource"];
    } catch (e) {
      print("imageSource");
      rethrow;
    }
    try {
      image = RecipeImage.fromJson(json["image"]);
    } catch (e) {
      print("image");
      rethrow;
    }
    try {
      instructions = json["instructions"];
    } catch (e) {
      print("instructions");
      rethrow;
    }
    try {
      ingredients = List<String>.from(json["ingredients"]);
    } catch (e) {
      print("ingredients");
      rethrow;
    }
    try {
      title = json["title"];
    } catch (e) {
      print("title");
      rethrow;
    }
    try {
      id = json["id"];
    } catch (e) {
      print("id");
      rethrow;
    }

    return Recipe(
        tags: tags,
        servings: servings,
        recipeSource: recipeSource,
        imageSource: imageSource,
        image: image,
        instructions: instructions,
        ingredients: ingredients,
        title: title,
        id: id,
        parsedIngredients: temp);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tags"] = tags;
    data["servings"] = servings;
    data["recipeSource"] = recipeSource;
    data["imageSource"] = imageSource;
    data["image"] = image.toJson();
    data["instructions"] = instructions;
    data["ingredients"] = ingredients;
    data["title"] = title;
    data["id"] = id;
    if (parsedIngredients != null) {
      data["parsedIngredients"] =
          parsedIngredients!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ParsedIngredients {
  double? confidence;
  String? product;
  dynamic productSizeModifier;
  dynamic quantity;
  dynamic unit;
  dynamic preparationNotes;
  dynamic usdaInfo;

  ParsedIngredients(this.confidence, this.product, this.productSizeModifier,
      this.quantity, this.unit, this.preparationNotes, this.usdaInfo);

  ParsedIngredients.fromJson(Map<String, dynamic> json) {
    if (json["confidence"] is double) {
      confidence = json["confidence"];
    }
    if (json["product"] is String) {
      product = json["product"];
    }
    productSizeModifier = json["productSizeModifier"];
    quantity = json["quantity"];
    unit = json["unit"];
    preparationNotes = json["preparationNotes"];
    usdaInfo = json["usda_info"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["confidence"] = confidence;
    data["product"] = product;
    data["productSizeModifier"] = productSizeModifier;
    data["quantity"] = quantity;
    data["unit"] = unit;
    data["preparationNotes"] = preparationNotes;
    data["usda_info"] = usdaInfo;
    return data;
  }
}

class RecipeImage {
  late String size120W;
  late String? size240W;
  late String? size320W;
  late String size640W;
  late String? size960W;
  late String size1280W;
  late String? size1600W;
  late String? size1920W;
  late String? size2240W;

  RecipeImage(
      this.size120W,
      this.size240W,
      this.size320W,
      this.size640W,
      this.size960W,
      this.size1280W,
      this.size1600W,
      this.size1920W,
      this.size2240W);

  RecipeImage.fromJson(Map<String, dynamic> json) {
    if (json["120w"] is String) {
      size120W = json["120w"];
    }
    if (json["240w"] is String) {
      size240W = json["240w"];
    }
    if (json["320w"] is String) {
      size320W = json["320w"];
    }
    if (json["640w"] is String) {
      size640W = json["640w"];
    }
    if (json["960w"] is String) {
      size960W = json["960w"];
    }
    if (json["1280w"] is String) {
      size1280W = json["1280w"];
    }
    if (json["1600w"] is String) {
      size1600W = json["1600w"];
    }
    if (json["1920w"] is String) {
      size1920W = json["1920w"];
    }
    if (json["2240w"] is String) {
      size2240W = json["2240w"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["120w"] = size120W;
    data["240w"] = size240W;
    data["320w"] = size320W;
    data["640w"] = size640W;
    data["960w"] = size960W;
    data["1280w"] = size1280W;
    data["1600w"] = size1600W;
    data["1920w"] = size1920W;
    data["2240w"] = size2240W;
    return data;
  }
}

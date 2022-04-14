class Recipe {
  final List<String>? tags;
  final String? servings;
  final String? recipeSource;
  final String? imageSource;
  final RecipeImage? image;
  final String? instructions;
  final List<String>? ingredients;
  final String? title;
  final String? id;
  final List<ParsedIngredients>? parsedIngredients;

  const Recipe(
      {this.tags,
      this.servings,
      this.recipeSource,
      this.imageSource,
      this.image,
      this.instructions,
      this.ingredients,
      this.title,
      this.id,
      this.parsedIngredients});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    var temp = null;
    if (json["parsedIngredients"] is List) {
      temp = json["parsedIngredients"] == null
          ? null
          : (json["parsedIngredients"] as List)
              .map((e) => ParsedIngredients.fromJson(e))
              .toList();
    }
    return Recipe(
        tags: List<String>.from(json["tags"]),
        servings: json["servings"],
        recipeSource: json["recipeSource"],
        imageSource: json["imageSource"],
        image: RecipeImage.fromJson(json["image"]),
        instructions: json["instructions"],
        ingredients: List<String>.from(json["ingredients"]),
        title: json["title"],
        id: json["id"],
        parsedIngredients: temp);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tags"] = tags;
    data["servings"] = servings;
    data["recipeSource"] = recipeSource;
    data["imageSource"] = imageSource;
    data["image"] = image!.toJson();
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
  late double? confidence;
  late String? product;
  late dynamic productSizeModifier;
  late dynamic quantity;
  late dynamic unit;
  late dynamic preparationNotes;
  late dynamic usdaInfo;

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
  late String? size120W;
  late String? size240W;
  late String? size320W;
  late String? size640W;
  late String? size960W;
  late String? size1280W;
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

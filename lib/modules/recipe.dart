class Recipe {
  final String id;
  final String title;
  final String source;
  final int preptime;
  final int waittime;
  final int cooktime;
  final int servings;
  final String comments;
  final int calories;
  final int fat;
  final int satfat;
  final int carbs;
  final int fiber;
  final int sugar;
  final int protein;
  final String instructions;
  final List<String> ingredients;
  final List<String> tags;

  Recipe(
      this.id,
      this.title,
      this.source,
      this.preptime,
      this.waittime,
      this.cooktime,
      this.servings,
      this.comments,
      this.calories,
      this.fat,
      this.satfat,
      this.carbs,
      this.fiber,
      this.sugar,
      this.protein,
      this.instructions,
      this.ingredients,
      this.tags);
}

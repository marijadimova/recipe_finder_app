class MealDetail {
  final String id;
  final String name;
  final String image;
  final String instructions;
  final String youtube;
  final List<String> ingredients;

  MealDetail({
    required this.id,
    required this.name,
    required this.image,
    required this.instructions,
    required this.youtube,
    required this.ingredients,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json["strIngredient$i"];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
      }
    }

    return MealDetail(
      id: json['idMeal'],
      name: json['strMeal'],
      image: json['strMealThumb'],
      instructions: json['strInstructions'],
      youtube: json['strYoutube'] ?? "",
      ingredients: ingredients,
    );
  }
}

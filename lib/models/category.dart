class Category {
  final String id;
  final String name;
  final String image;
  String description;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    // Додавање на рачен краток опис за секоја категорија
    String manualDescription;
    switch (json['strCategory']) {
      case "Beef":
        manualDescription = "Delicious beef recipes from around the world.";
        break;
      case "Chicken":
        manualDescription = "Tasty chicken meals for every occasion.";
        break;
      case "Dessert":
        manualDescription = "Sweet and delightful desserts to enjoy.";
        break;
      case "Lamb":
        manualDescription = "Juicy lamb dishes full of flavor.";
        break;
      case "Miscellaneous":
        manualDescription = "Various unique recipes to try.";
        break;
      case "Pasta":
        manualDescription = "Classic and modern pasta recipes.";
        break;
      case "Pork":
        manualDescription = "Savory pork dishes for meat lovers.";
        break;
      case "Seafood":
        manualDescription = "Fresh and tasty seafood recipes.";
        break;
      case "Side":
        manualDescription = "Perfect side dishes for any meal.";
        break;
      case "Starter":
        manualDescription = "Appetizers to start your meal right.";
        break;
      case "Vegan":
        manualDescription = "Healthy and delicious vegan recipes.";
        break;
      case "Vegetarian":
        manualDescription = "Nutritious and tasty vegetarian dishes.";
        break;
      default:
        manualDescription = "Delicious meals in this category.";
    }

    return Category(
      id: json['idCategory'],
      name: json['strCategory'],
      image: json['strCategoryThumb'],
      description: manualDescription, // користиме рачен опис
    );
  }
}

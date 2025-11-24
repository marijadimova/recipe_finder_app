import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/category.dart';
import '../screens/meals_by_category_screen.dart';
import '../screens/meal_detail_screen.dart';
import '../colors.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> categories = [];
  String search = "";

  // Кратки описи за категориите
  final Map<String, String> shortDescriptions = {
    'Beef': "Delicious beef recipes for meat lovers.",
    'Chicken': "Tasty chicken dishes from around the world.",
    'Dessert': "Sweet treats to satisfy your cravings.",
    'Pasta': "Italian pasta recipes for every occasion.",
    'Seafood': "Fresh seafood recipes for your table.",
    'Vegetarian': "Healthy and delicious vegetarian dishes.",
  };

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  void loadCategories() async {
    categories = await ApiService.getCategories();
    setState(() {});
  }

  void showRandomMeal() async {
    final meal = await ApiService.getRandomMeal();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => MealDetailScreen(meal: meal)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filtered = categories
        .where((c) => c.name.toLowerCase().contains(search.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        title: Text(
          "Meal Categories",
          style: TextStyle(fontSize: 20),
        ),

        /// ✔ Копче за random meal во actions (правилен Flutter UX)
        actions: [
          IconButton(
            icon: Icon(Icons.shuffle, color: Colors.white),
            tooltip: "Random Meal",
            onPressed: showRandomMeal,
          ),
        ],
      ),

      body: Column(
        children: [
          /// SEARCH BAR
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search category...",
                filled: true,
                fillColor: AppColors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),

          /// LIST OF CATEGORIES
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final cat = filtered[index];
                return Card(
                  color: AppColors.white,
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              MealsByCategoryScreen(category: cat.name),
                        ),
                      );
                    },

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE
                        ClipRRect(
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                          child: Image.network(
                            cat.image,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// TEXT
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cat.name,
                                style: TextStyle(
                                  color: AppColors.darkGreen,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 6),
                              Text(
                                shortDescriptions[cat.name] ??
                                    "Explore delicious ${cat.name} recipes.",
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// screens/meals_by_category_screen.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/meal.dart';
import '../widgets/meal_card.dart';
import 'meal_detail_screen.dart';
import '../widgets/common_appbar.dart';   // НОВ ИМПОРТ

class MealsByCategoryScreen extends StatefulWidget {
  final String category;

  const MealsByCategoryScreen({required this.category});

  @override
  State<MealsByCategoryScreen> createState() => _MealsByCategoryScreenState();
}

class _MealsByCategoryScreenState extends State<MealsByCategoryScreen> {
  List<Meal> meals = [];
  String search = "";

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    meals = await ApiService.getMealsByCategory(widget.category);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final filtered = meals.where((m) =>
        m.name.toLowerCase().contains(search.toLowerCase())).toList();

    return Scaffold(
      appBar: CommonAppBar(title: widget.category), // СМЕНЕТ AppBar
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search meal...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
              onChanged: (v) => setState(() => search = v),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              padding: EdgeInsets.all(10),
              children: filtered.map((meal) {
                return MealCard(
                  meal: meal,
                  onTap: () async {
                    final detail = await ApiService.getMealDetail(meal.id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealDetailScreen(meal: detail),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
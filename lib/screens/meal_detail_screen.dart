// screens/meal_detail_screen.dart
import 'package:flutter/material.dart';
import '../models/meal_detail.dart';
import '../colors.dart';
import '../widgets/common_appbar.dart';   // НОВ ИМПОРТ

class MealDetailScreen extends StatelessWidget {
  final MealDetail meal;

  const MealDetailScreen({required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: meal.name), // СМЕНЕТ AppBar
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(meal.image),
            ),
            SizedBox(height: 20),

            Text("Ingredients:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen,
              ),
            ),
            SizedBox(height: 10),

            ...meal.ingredients.map((i) => Padding(
              padding: EdgeInsets.symmetric(vertical: 2),
              child: Text("- $i"),
            )),

            SizedBox(height: 20),

            Text("Instructions:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.darkGreen,
              ),
            ),
            SizedBox(height: 10),

            Text(meal.instructions.replaceAll("\r\n", "\n")),

            SizedBox(height: 30),

            if (meal.youtube.isNotEmpty)
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.darkGreen,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
                icon: Icon(Icons.play_arrow),
                label: Text("Watch on YouTube"),
                onPressed: () {
                },
              ),
          ],
        ),
      ),
    );
  }
}
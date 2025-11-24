import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';
import 'colors.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Recipes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.darkGreen,
        scaffoldBackgroundColor: AppColors.cream,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.darkGreen,
          elevation: 4,
          shadowColor: Colors.black45,
        ),
      ),
      home: CategoriesScreen(),
    );
  }
}

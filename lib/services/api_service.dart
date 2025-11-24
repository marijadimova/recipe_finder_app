import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';
import '../models/meal.dart';
import '../models/meal_detail.dart';

class ApiService {
  static const base = "https://www.themealdb.com/api/json/v1/1";

  static Future<List<Category>> getCategories() async {
    final res = await http.get(Uri.parse("$base/categories.php"));
    final data = json.decode(res.body);
    return (data['categories'] as List)
        .map((c) => Category.fromJson(c))
        .toList();
  }

  static Future<List<Meal>> getMealsByCategory(String category) async {
    final res = await http.get(Uri.parse("$base/filter.php?c=$category"));
    final data = json.decode(res.body);
    return (data['meals'] as List)
        .map((m) => Meal.fromJson(m))
        .toList();
  }

  static Future<MealDetail> getMealDetail(String id) async {
    final res = await http.get(Uri.parse("$base/lookup.php?i=$id"));
    final data = json.decode(res.body);
    return MealDetail.fromJson(data['meals'][0]);
  }

  static Future<MealDetail> getRandomMeal() async {
    final res = await http.get(Uri.parse("$base/random.php"));
    final data = json.decode(res.body);
    return MealDetail.fromJson(data['meals'][0]);
  }
}

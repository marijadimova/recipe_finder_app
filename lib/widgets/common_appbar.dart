// lib/widgets/common_appbar.dart
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../screens/meal_detail_screen.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: const Color(0xFF204E4A), // директно боја, без AppColors проблем
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(Icons.shuffle, size: 30),
          tooltip: "Random Recipe",
          onPressed: () async {
            final randomMeal = await ApiService.getRandomMeal();
            if (context.mounted) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => MealDetailScreen(meal: randomMeal),
                ),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
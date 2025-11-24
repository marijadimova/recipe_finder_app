import 'package:flutter/material.dart';
import '../models/category.dart';
import '../colors.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  final VoidCallback onTap;

  const CategoryCard({required this.category, required this.onTap});

  String cleanDescription(String desc) {
    // Скратување на 80 карактери и чистење на нови редови и HTML карактери
    String cleaned = desc.replaceAll(RegExp(r'\r\n|\n|\r'), ' ').trim();
    if (cleaned.length > 80) {
      cleaned = cleaned.substring(0, 80) + "...";
    }
    return cleaned;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      margin: EdgeInsets.all(10),
      elevation: 5,
      shadowColor: Colors.black38,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                category.image,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                category.name,
                style: TextStyle(
                  color: AppColors.darkGreen,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                cleanDescription(category.description),
                style: TextStyle(color: Colors.grey[800]),
              ),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

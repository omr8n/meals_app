import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal_model.dart';

import 'package:meals_app/views/meals_view.dart';

import '../models/category_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key,
      required this.category,
      required this.ontoggleFavourite,
      required this.availableMeal});
  final CategoryModels category;
  final List<MealModels> availableMeal;
  final void Function(MealModels meal) ontoggleFavourite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final List<MealModels> filterdMeal = availableMeal
            .where(
              (element) => element.categories.contains(category.id),
            )
            .toList();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => MealsView(
            ontoggleFavourite: ontoggleFavourite,
            title: category.title,
            meal: filterdMeal,
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.4),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}

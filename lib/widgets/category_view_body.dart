// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../dummy_data.dart';

import '../models/meal_model.dart';
import 'category_grid_item.dart';

class CategoryViewBody extends StatelessWidget {
  const CategoryViewBody({
    super.key,
    required this.ontoggleFavourite,
  });
  final void Function(MealModels meal) ontoggleFavourite;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemCount: availableCategories.length,
      itemBuilder: (context, index) => CategoryGridItem(
        category: availableCategories[index],
        ontoggleFavourite: ontoggleFavourite,
      ),
    );
  }
}



// children: [
//         for (final item in availableCategories) CategoryGridItem(category: item)
//       ],
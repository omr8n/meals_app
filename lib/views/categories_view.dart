import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/category_view_body.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key, required this.ontoggleFavourite});
  final void Function(MealModels meal) ontoggleFavourite;
  @override
  Widget build(BuildContext context) {
    return CategoryViewBody(
      ontoggleFavourite: ontoggleFavourite,
    );
  }
}

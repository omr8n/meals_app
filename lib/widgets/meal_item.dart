import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onTap});
  final MealModels meal;
  final void Function(MealModels meal) onTap;
  // void selectMeal(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed(
  //     MealDetailView(meal: meal).routeName,
  //     arguments: id,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    log(" omran ================================ ${meal.imageUrl.toString()}");
    // var lan = Provider.of<LanguageProvider>(context, listen: true);
    return Card(
      // margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      // clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 2,
      child: InkWell(
        onTap: () => onTap(meal),
        child: Stack(
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )),
            Positioned(
              bottom: 20,
              right: 10,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: const Text(
                  // lan.getTexts("meal-$id").toString(),
                  "omran",
                  style: TextStyle(fontSize: 26, color: Colors.white),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(16),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Row(
                //         children: [
                //           Icon(Icons.schedule,
                //               color: Theme.of(context).splashColor),
                //           const SizedBox(width: 6),
                //           Text("${meal.duration} minute"),
                //           // if (duration <= 10)
                //           //   Text("$duration " + lan.getTexts("min2").toString()),
                //           // if (duration > 10)
                //           //   Text("$duration " + lan.getTexts("min").toString()),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Icon(Icons.work,
                //               color: Theme.of(context).splashColor),
                //           const SizedBox(width: 6),
                //           Text(meal.getComplexity),
                //         ],
                //       ),
                //       Row(
                //         children: [
                //           Icon(Icons.attach_money,
                //               color: Theme.of(context).splashColor),
                //           const SizedBox(width: 6),
                //           // Text(.getTexts('$affordability').toString()),
                //           Text(meal.getAffordability),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

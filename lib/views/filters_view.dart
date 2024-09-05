// import 'package:flutter/material.dart';

// import '../widgets/main_drawer.dart';

// class FiltersView extends StatefulWidget {
//   static const routeName = '/filters';

//   final bool fromOnBoarding;

//   const FiltersView({this.fromOnBoarding = false});

//   @override
//   State<FiltersView> createState() => _FiltersViewState();
// }

// class _FiltersViewState extends State<FiltersView> {
//   Widget buildSwitchListTile(String title, String description,
//       bool currentValue, Function(bool) updateValue, BuildContext ctx) {
//     return SwitchListTile(
//       title: Text(title),
//       value: currentValue,
//       subtitle: Text(description),
//       onChanged: updateValue,
//       inactiveTrackColor:
//           Provider.of<ThemeProvider>(ctx, listen: true).tm == ThemeMode.light
//               ? null
//               : Colors.black,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Map<String, bool> currentFilters =
//         Provider.of<MealProvider>(context, listen: true).filters;
//     var lan = Provider.of<LanguageProvider>(context, listen: true);
//     return Directionality(
//       textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
//       child: Scaffold(
//         appBar: widget.fromOnBoarding
//             ? AppBar(
//                 backgroundColor: Theme.of(context).canvasColor, elevation: 0)
//             : AppBar(
//                 title: Text(lan.getTexts('filters_appBar_title').toString())),
//         body: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               child: Text(lan.getTexts('filters_screen_title').toString(),
//                   style: Theme.of(context).textTheme.headline6),
//             ),
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildSwitchListTile(
//                     lan.getTexts('Gluten-free').toString(),
//                     lan.getTexts('Gluten-free-sub').toString(),
//                     currentFilters['gluten']!,
//                     (newValue) {
//                       currentFilters['gluten'] = newValue;
//                       Provider.of<MealProvider>(context, listen: false)
//                           .setFilters();
//                     },
//                     context,
//                   ),
//                   buildSwitchListTile(
//                     lan.getTexts('Lactose-free').toString(),
//                     lan.getTexts('Lactose-free_sub').toString(),
//                     currentFilters['lactose']!,
//                     (newValue) {
//                       currentFilters['lactose'] = newValue;

//                       Provider.of<MealProvider>(context, listen: false)
//                           .setFilters();
//                     },
//                     context,
//                   ),
//                   buildSwitchListTile(
//                     lan.getTexts('Vegetarian').toString(),
//                     lan.getTexts('Vegetarian-sub').toString(),
//                     currentFilters['vegetarian']!,
//                     (newValue) {
//                       currentFilters['vegetarian'] = newValue;
//                       Provider.of<MealProvider>(context, listen: false)
//                           .setFilters();
//                     },
//                     context,
//                   ),
//                   buildSwitchListTile(
//                     lan.getTexts('Vegan').toString(),
//                     lan.getTexts('Vegan-sub').toString(),
//                     currentFilters['vegan']!,
//                     (newValue) {
//                       currentFilters['vegan'] = newValue;
//                       Provider.of<MealProvider>(context, listen: false)
//                           .setFilters();
//                     },
//                     context,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: widget.fromOnBoarding ? 80 : 0),
//           ],
//         ),
//         drawer: widget.fromOnBoarding ? null : MainDrawer(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FiltersView extends StatefulWidget {
  const FiltersView({super.key, required this.currentFilter});

  @override
  State<FiltersView> createState() => _FiltersViewState();
  final Map<Filter, bool> currentFilter;
}

enum Filter { isGlutenFree, isVegan, isVegetarian, isLactoseFree }

class _FiltersViewState extends State<FiltersView> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget.currentFilter[Filter.isGlutenFree]!;
    _isLactoseFree = widget.currentFilter[Filter.isLactoseFree]!;
    _isVegan = widget.currentFilter[Filter.isVegan]!;
    _isVegetarian = widget.currentFilter[Filter.isVegetarian]!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: MainDrawer(
      //   onSelectedVeiw: (identiFire) {
      //     Navigator.of(context).pop();
      //     if (identiFire == "Meal") {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (context) => const TabsVeiw(),
      //       ));
      //     } else {
      //       Navigator.of(context).pop();
      //     }
      //   },
      // ),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.isGlutenFree: _isGlutenFree,
            Filter.isLactoseFree: _isLactoseFree,
            Filter.isVegan: _isVegan,
            Filter.isVegetarian: _isVegetarian,
          });
          return false;
        },
        child: Column(
          children: [
            customSwitchListTile(
              context,
              title: "orman",
              subtitle: "abo ali , ",
              filter: _isGlutenFree,
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              },
            ),
            customSwitchListTile(
              context,
              title: "orman",
              subtitle: "abo ali , ",
              filter: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
            ),
            customSwitchListTile(
              context,
              title: "orman",
              subtitle: "abo ali , ",
              filter: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
            ),
            customSwitchListTile(
              context,
              title: "orman",
              subtitle: "abo ali , ",
              filter: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile customSwitchListTile(BuildContext context,
      {required String title,
      required String subtitle,
      required bool filter,
      required void Function(bool value) onChanged}) {
    return SwitchListTile(
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
        value: filter,
        onChanged: onChanged);
  }
}

import 'package:flutter/material.dart';
import 'package:meals_app/models/meal_model.dart';
import 'package:meals_app/views/categories_view.dart';
import 'package:meals_app/views/filters_view.dart';
import 'package:meals_app/views/meals_view.dart';
import 'package:meals_app/widgets/custom_snack_bar.dart';

import '../widgets/main_drawer.dart';

// class TabsView extends StatefulWidget {
//   static get routeName => 'tabs_screen';

//   const TabsView({super.key});
//   @override
//   _TabsViewState createState() => _TabsViewState();
// }

// class _TabsViewState extends State<TabsView> {
//   List<Map<String, Object>> _pages = [];
//   int _selectedPageIndex = 0;

//   @override
//   void initState() {
//     // Provider.of<MealProvider>(context, listen: false).getData();
//     // Provider.of<ThemeProvider>(context, listen: false).getThemeMode();
//     // Provider.of<ThemeProvider>(context, listen: false).getThemeColors();
//     // Provider.of<LanguageProvider>(context, listen: false).getLan();
//     super.initState();
//   }

//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var lan = Provider.of<LanguageProvider>(context, listen: true);
//     _pages = [
//       {
//         'page': CategoriesScreen(),
//         'title': lan.getTexts('categories'),
//       },
//       {
//         'page': FavoritesScreen(),
//         'title': lan.getTexts('your_favorites'),
//       },
//     ];
//     return Directionality(
//       textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
//       child: Scaffold(
//         appBar:
//             AppBar(title: Text(_pages[_selectedPageIndex]['title'].toString())),
//         body: _pages[_selectedPageIndex]['page'] as Widget,
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: _selectPage,
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           selectedItemColor: Theme.of(context).colorScheme.secondary,
//           unselectedItemColor: Colors.white,
//           currentIndex: _selectedPageIndex,
//           items: [
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.category),
//               label: lan.getTexts('categories').toString(),
//             ),
//             BottomNavigationBarItem(
//               icon: const Icon(Icons.star),
//               label: lan.getTexts('your_favorites').toString(),
//             ),
//           ],
//         ),
//         drawer: MainDrawer(),
//       ),
//     );
//   }
// }

class TabsVeiw extends StatefulWidget {
  const TabsVeiw({super.key});

  @override
  State<TabsVeiw> createState() => _TabsVeiwState();
}

class _TabsVeiwState extends State<TabsVeiw> {
  int _selectedPageIndex = 0;
  // final List<Map<String, Object>> _pages = [];
  final List<MealModels> _favouriteMeal = [];

  void _toggleMealFavouriteStatus(MealModels meal) {
    final isExisting = _favouriteMeal.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeal.remove(meal);
        customSnackBar(context, "remove");
      });
    } else {
      setState(() {
        _favouriteMeal.add(meal);
        customSnackBar(context, "addd");
      });
    }
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setView(String identifire) {
    if (identifire == "Filters") {
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const FiltersView(),
      ));
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesView(
      ontoggleFavourite: _toggleMealFavouriteStatus,
    );
    var activePageTitle = "Pick Your Categories";
    if (_selectedPageIndex == 1) {
      activePage = MealsView(
        ontoggleFavourite: _toggleMealFavouriteStatus,
        title: "Faovvvvv",
        meal: _favouriteMeal,
      );
      activePageTitle = "Favorites";
    }
    return Scaffold(
      drawer: MainDrawer(
        onSelectedVeiw: _setView,
      ),
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPageIndex,
          onTap: _selectPage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "categories",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: "your_favorites",
            ),
          ]),
    );
  }
}

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
import 'package:meals_app/views/tabs_veiw.dart';

import '../widgets/main_drawer.dart';

class FiltersView extends StatelessWidget {
  const FiltersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(
        onSelectedVeiw: (identiFire) {
          Navigator.of(context).pop();
          if (identiFire == "Meal") {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const TabsVeiw(),
            ));
          } else {
            Navigator.of(context).pop();
          }
        },
      ),
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    );
  }
}

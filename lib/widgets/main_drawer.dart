// import 'package:flutter/material.dart';

// class MainDrawer extends StatefulWidget {
//   @override
//   _MainDrawerState createState() => _MainDrawerState();
// }

// class _MainDrawerState extends State<MainDrawer> {
//   Widget buildListTile(
//       String title, IconData icon, Function() tapHandler, BuildContext ctx) {
//     return ListTile(
//       leading: Icon(icon, size: 26, color: Theme.of(ctx).splashColor),
//       title: Text(
//         title,
//         style: TextStyle(
//           color: Theme.of(ctx).textTheme.bodyText1!.color,
//           fontSize: 24,
//           fontFamily: 'RobotoCondensed',
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       onTap: tapHandler,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//   //  var lan = Provider.of<LanguageProvider>(context, listen: true);
//     // return Directionality(
//    //   textDirection: lan.isEn ? TextDirection.ltr : TextDirection.rtl,
//      return Drawer(
//         elevation: 0,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 120,
//                 width: double.infinity,
//                 padding: EdgeInsets.all(20),
//                // alignment:
//                //     lan.isEn ? Alignment.centerLeft : Alignment.centerRight,
//                 color: Theme.of(context).colorScheme.secondary,
//                 child: Text("omran",
//                //   lan.getTexts('drawer_name').toString(),
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.w900,
//                     color: Theme.of(context).colorScheme.primary,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               buildListTile(
//                   lan.getTexts('drawer_item1').toString(), Icons.restaurant,
//                   () {
//                 Navigator.of(context)
//                     .pushReplacementNamed(TabsScreen.routeName);
//               }, context),
//               buildListTile(
//                   lan.getTexts('drawer_item2').toString(), Icons.settings, () {
//                 Navigator.of(context)
//                     .pushReplacementNamed(FiltersScreen.routeName);
//               }, context),
//               buildListTile(
//                   lan.getTexts('drawer_item3').toString(), Icons.color_lens,
//                   () {
//                 Navigator.of(context)
//                     .pushReplacementNamed(ThemesScreen.routeName);
//               }, context),
//               Divider(
//                 height: 10,
//                 color: Colors.black54,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 lan.getTexts('drawer_switch_title').toString(),
//                 style: Theme.of(context).textTheme.headline6,
//                 textAlign: TextAlign.center,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(lan.getTexts('drawer_switch_item2').toString(),
//                       style: Theme.of(context).textTheme.headline6),
//                   Switch(
//                     value: lan.isEn,
//                     onChanged: (newValue) {
//                       lan.changeLan(newValue);
//                       Navigator.of(context).pop();
//                     },
//                     inactiveTrackColor:
//                         //Provider.of<ThemeProvider>(context, listen: true).tm ==
//                                 ThemeMode.light
//                             ? null
//                             : Colors.black,
//                   ),
//                   Text(lan.getTexts('drawer_switch_item1').toString(),
//                       style: Theme.of(context).textTheme.headline6),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Divider(
//                 height: 10,
//                 color: Colors.black54,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectedVeiw});
  final void Function(String identifire) onSelectedVeiw;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(.4),
            ])),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.fastfood,
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cooking Up",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pop();
              onSelectedVeiw("meal");
            },
            leading: Icon(
              Icons.restaurant_menu,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              "Meal",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectedVeiw("Filters");
            },
            leading: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            title: Text(
              "Filters",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
          )
        ],
      ),
    );
  }
}

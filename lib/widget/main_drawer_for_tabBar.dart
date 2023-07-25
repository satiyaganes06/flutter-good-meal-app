import 'package:flutter/material.dart';
import 'package:mealsapp/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
Widget buildListTile(String title, IconData icon,Function() tapHandler)
// you van also use simple Icon instead of IconData then you have to
  // just write leading:icon and not leading : Icon(icon),
  // but below you have to provide Icon(Icons.restaurant than
  // Icons.restaurant but IconData is more useful for performance

{
  return ListTile(
    onTap: tapHandler,
    leading: Icon(icon),
    title: Text(title,style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),),
  );
}
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orangeAccent.shade100,
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: Colors.amberAccent.shade700,
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: const Text('Cooking Up!',style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 25,
              color: Colors.red,
            ),),
          ),
          const SizedBox(height: 20,),
         buildListTile('Meals', Icons.restaurant,
             (){
           Navigator.of(context).pushReplacementNamed('/');
             },
         ),
          buildListTile('Filters', Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltersScreen.filtersRouteName);
          },),
        ],
      ),
    );
  }
}

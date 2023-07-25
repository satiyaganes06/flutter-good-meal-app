import 'package:flutter/material.dart';
import 'package:mealsapp/main.dart';

class CategoryItem extends StatelessWidget {
  final String itemTitle;
  final String itemId;
  final Color itemColor;

  const CategoryItem({super.key,
    required this.itemId,
    required this.itemTitle,
    required this.itemColor,
  });

  void selectedMeal(BuildContext ctx){
    Navigator.of(ctx).pushNamed(
      MyApp.categoryMealsScreen ,arguments: {
        'id': itemId,
      'title' : itemTitle,
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>selectedMeal(context),
      splashColor: Colors.blueGrey,
      mouseCursor: MouseCursor.defer,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                itemColor.withOpacity(0.7),
                itemColor,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(
          itemTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}

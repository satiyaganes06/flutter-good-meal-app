import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/widget/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  const CategoryMealScreen({super.key, required this.availableMeals});

  final List<Meal> availableMeals;
  @override
  State<CategoryMealScreen> createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  var categoryTitle;
  late List<Meal> categoryMeal ;
  var _loadingInitData= false;
  @override
  void didChangeDependencies() {
    if(!_loadingInitData) {
      final routeArgument =
      ModalRoute
          .of(context)
          ?.settings
          .arguments as Map<String, String>;
      categoryTitle = routeArgument['title'];
      final categoryId = routeArgument['id'];

      categoryMeal = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadingInitData = true;
    }
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text((categoryTitle.toString())),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealsItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}

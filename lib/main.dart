import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';
import 'package:mealsapp/screens/category_meals_screen.dart';
import 'package:mealsapp/screens/category_screen.dart';
import 'package:mealsapp/screens/filters_screen.dart';
import 'package:mealsapp/screens/meals_details_screen.dart';
import 'package:mealsapp/screens/tab_bar_screen.dart';

import 'models/meals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static const categoryMealsScreen = 'category-meals';
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    'gluten': false,
    'lactose' : false,
    'vegan' : false,
    'vegetarian' : false,
  };
  List<Meal> availableMeals =dummyMeals;

  void _setFilters(Map<String, bool> filterdData)
  {
    setState(() {
      _filters = filterdData ;

      availableMeals = dummyMeals.where((meal){
        if(_filters['gluten']! && !meal.isGlutenFree)
          {
            return false;
          }
        if(_filters['lactose']! && !meal.isLactoseFree)
        {
          return false;
        }
        if(_filters['vegan']! && !meal.isVegan)
        {
          return false;
        }
        if(_filters['vegetarian']! && !meal.isVegetarian)
        {
          return false;
        }
        return true;
      }).toList();

    });
  }

  final List<Meal> _favouriteMeal=[];

void _toogleFavourite(String mealId) {
  final existingIndex = _favouriteMeal.indexWhere((meal) => meal.id == mealId);
  if (existingIndex >= 0) {
    _favouriteMeal.removeAt(existingIndex);
    setState(() {

    });
  }
  else
    {
      _favouriteMeal.add(dummyMeals.firstWhere((meal)=> meal.id== mealId)) ;
      setState(() {
      });
    }
}

bool isMealFavourite(String id)
{
  return _favouriteMeal.any((meal)=>meal.id== id);
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodMeal',
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      debugShowCheckedModeBanner: false,
      // home: const CategoriesScreen(),
      routes: {
        '/': (context) =>  TabsBarScreen(favouriteMeal: _favouriteMeal), // default route
        'category-meals': (context) =>CategoryMealScreen(availableMeals: availableMeals),
        MealsDetailScreen.mealsScreenRoute: (context) => MealsDetailScreen(_toogleFavourite, isMealFavourite),
        FiltersScreen.filtersRouteName :(context) =>  FiltersScreen(_setFilters, _filters),
      },

      // in case some route isn't defined in above routes section
      // then onGenerate route will be executed taking the user to
      // CategoriesScreen

      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const CategoriesScreen(),
        );
      },

      // In case the route is not set in routes section and nor the
      // onGenerateRoute is set then onUnknowRoute will get executed
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) =>const CategoriesScreen());
      },
    );
  }
}

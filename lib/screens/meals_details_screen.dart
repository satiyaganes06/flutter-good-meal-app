import 'package:flutter/material.dart';
import 'package:mealsapp/dummy_data.dart';

class MealsDetailScreen extends StatelessWidget {
  static const mealsScreenRoute = '/meals_screen';
  final Function toogleFavourite;
  final Function isMealFavourite;
  const MealsDetailScreen(this.toogleFavourite, this.isMealFavourite,
      {super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildSectionTitle(String text) {
      return Container(
        padding: const EdgeInsets.all(10),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
      );
    }

    Widget buildListItems(Widget child) {
      return Container(
        height: 140,
        width: 250,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      );
    }

    var mealsId = ModalRoute.of(context)?.settings.arguments as String;
    var selectedMeal = dummyMeals.firstWhere((meal) => meal.id == mealsId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle('Ingredients'),
            buildListItems(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle('Steps'),
            buildListItems(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ListTile(
                        title: Text(selectedMeal.steps[index].toString()),
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:()=> toogleFavourite(mealsId),
        child: isMealFavourite(mealsId)
            ? const Icon(Icons.star)
            : const Icon(Icons.star_border),
      ),
    );
  }
}

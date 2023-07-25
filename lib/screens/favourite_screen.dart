import 'package:flutter/cupertino.dart';

import '../models/meals.dart';
import '../widget/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key,required this.favouriteMeal});
final List<Meal> favouriteMeal;
  @override
  Widget build(BuildContext context) {
    if(favouriteMeal.isEmpty) {
      return const Center(
        child: Text('Favourites Screen'),
      );
    }
    else
      {
        return ListView.builder(
          itemBuilder: (context, index) {
            return MealsItem(
              id: favouriteMeal[index].id,
              title: favouriteMeal[index].title,
              imageUrl: favouriteMeal[index].imageUrl,
              duration: favouriteMeal[index].duration,
              complexity: favouriteMeal[index].complexity,
              affordability: favouriteMeal[index].affordability,
            );
          },
          itemCount: favouriteMeal.length,
        );
      }
  }
}

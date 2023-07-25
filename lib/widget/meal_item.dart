
import 'package:flutter/material.dart';
import 'package:mealsapp/models/meals.dart';
import 'package:mealsapp/screens/meals_details_screen.dart';

class MealsItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  const MealsItem({super.key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });


  String get complexityText {
    switch(complexity)
        {
      case Complexity.Simple :
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default :
        return 'Unknown';
    }
  }
  String get affordabilityText {
    switch(affordability)
    {
      case Affordability.Affordable :
        return 'Affordable';
      case Affordability.Luxurious:
        return 'Luxurious';
      case Affordability.Pricey:
        return 'Pricey';
      default :
        return 'Unknown';
    }
  }



  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
        MealsDetailScreen.mealsScreenRoute,
    arguments: id,
    ).then((resultfromPop){
    if(resultfromPop != null)
      {
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: 20,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      width: 280,
                      color: Colors.black54,
                      child: Text(title, style:const TextStyle(
                  fontSize: 25,
                  color: Colors.white
                ),),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Row(
                  children: [
                    const Icon(Icons.schedule),
                   const SizedBox(width: 5,),
                    Text('${duration}min'),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 5,),
                    Text('$complexityText '),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 5,),
                    Text(affordabilityText),
                  ],
                ),
              ],),
            )
          ],
        ),
      ),
    );
  }
}

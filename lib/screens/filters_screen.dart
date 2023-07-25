import 'package:flutter/material.dart';
import 'package:mealsapp/widget/main_drawer_for_tabBar.dart';
class FiltersScreen extends StatefulWidget {
static const filtersRouteName = 'filters-screen';
final Function getFilters;
final currentFilters;
const FiltersScreen(this.getFilters, this.currentFilters, {super.key});
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}
class _FiltersScreenState extends State<FiltersScreen> {
var _gluttenFree =false;
var _lactoseFree = false ;
var _vegan = false;
var _vegetarian =false;
@override
  void initState() {
    _gluttenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }
Widget buildSwitchListTile(
    String title,
    String desc ,
    Function(bool newVal) updateValue,
    bool value,
    ){
  return SwitchListTile(
    value: value,
    onChanged: updateValue,
    title: Text(title),
    subtitle: Text(desc),
  );
}
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Filters'),
      backgroundColor: Colors.amber,
      actions: [
        // IconButton(onPressed: widget.getFilters, icon: Icon(Icons.save)),
        TextButton(onPressed: () {
          final selectedFilters={
            'gluten': _gluttenFree,
            'lactose' : _lactoseFree,
            'vegan' : _vegan,
            'vegetarian' :_vegetarian,
          };
          widget.getFilters(selectedFilters);
        }, child:const Text('Save',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20
        ),),)
      ],
      ),
        drawer: const MainDrawer(),
        body:Column(
          children: [
            Container(
              padding:const EdgeInsets.all(10),
              child:const Text('Adjust Your Meal Selection',
            style:TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
            buildSwitchListTile(
                'Gluten-Free',
                'Only include Glutten-Free Meals',
                    (newValue){
                      setState(() {
                        _gluttenFree =newValue;
                      });
                    },
                _gluttenFree),
            buildSwitchListTile(
                'Lactose-Free',
                'Only include Lactose-Free Meals',
                    (newValue){
                  setState(() {
                    _lactoseFree =newValue;
                  });
                },
                _lactoseFree),
            buildSwitchListTile(
                'Vegan',
                'Only include Vegan Meals',
                    (newValue){
                  setState(() {
                    _vegan =newValue;
                  });
                },
                _vegan),
            buildSwitchListTile(
                'Vegetarian',
                'Only include Vegetarian Meals',
                    (newValue){
                  setState(() {
                    _vegetarian =newValue;
                  });
                },
                _vegetarian),
          ],
        ),
    );
  }
}

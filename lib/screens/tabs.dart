import 'package:flutter/material.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/main_drawer.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarianFree: false,
  Filter.veganFree: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _FevoriteMeals = [];


  // void _toggelMealFovoriteStatus(Meal meal) {
  //   final isExisting = _FevoriteMeals.contains(meal);

  //   if (isExisting == true) {
  //     setState(() {
  //       _FevoriteMeals.remove(meal);
  //     });
  //     _showInfoMessage("Meal is no longer a favorite.");
  //   } else {
  //     setState(() {
  //       _FevoriteMeals.add(meal);
  //     });
  //     _showInfoMessage("Marked as a favorite!");
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
    await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(  ),
        ),
      );
     ;

    
    }
  }

  @override
  Widget build(BuildContext context) {
  
    final avilableMeals = ref.watch(filteredMealsProvide);

    Widget activePage = CategoriesScreen(
      //  onToggleFevorite: _toggelMealFovoriteStatus,
      avilableMeals: avilableMeals,
    );
    var activePageTitle = "Categories";
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);
      activePage = MealsScreen(
        meals: favoriteMeals,
        //   onToggleFevorite: _toggelMealFovoriteStatus,
      );
      activePageTitle = "Your Favorites";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categoreys"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
    );
  }
}

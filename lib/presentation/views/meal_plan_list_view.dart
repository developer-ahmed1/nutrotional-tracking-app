import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/core/theming/assets_data.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_item.dart';

class MealPlanListView extends StatefulWidget {
  const MealPlanListView({
    super.key,
    required this.selectedCategory,
    required this.searchText,
  });
  final String selectedCategory;
  final String searchText;

  @override
  State<MealPlanListView> createState() => _MealPlanListViewState();
}

class _MealPlanListViewState extends State<MealPlanListView> {
  List<MealModel> allMeals = [
    MealModel(
      title: "Rice Porridge",
      image: AssetsData.ricePorridge,
      caloriesQuantity: 97,
      carbsQuantity: 16,
      proteinQuantity: 2.5,
      fatQuantity: 3.1,
      category: "Lunch",
    ),
    MealModel(
      title: "Avocado",
      image: AssetsData.avocado,
      caloriesQuantity: 160,
      carbsQuantity: 9,
      proteinQuantity: 2,
      fatQuantity: 15,
      category: 'Dinner',
    ),
    MealModel(
      title: "Chicken",
      image: AssetsData.chicken,
      caloriesQuantity: 190,
      carbsQuantity: 0,
      proteinQuantity: 16,
      fatQuantity: 14,
      category: 'Lunch',
    ),
    MealModel(
      title: "Eggs",
      image: AssetsData.eggs,
      caloriesQuantity: 155,
      carbsQuantity: 3,
      proteinQuantity: 13,
      fatQuantity: 4,
      category: 'Breakfast',
    ),
    MealModel(
      title: "Pancakes",
      image: AssetsData.pancakes,
      caloriesQuantity: 230.7,
      carbsQuantity: 28,
      proteinQuantity: 6,
      fatQuantity: 10,
      category: 'Breakfast',
    ),
  ];

  List<MealModel> get filteredMeals {
    List<MealModel> filtered =
        widget.selectedCategory == 'All'
            ? allMeals
            : allMeals
                .where((meal) => meal.category == widget.selectedCategory)
                .toList();

    if (widget.searchText.isNotEmpty) {
      filtered =
          filtered
              .where(
                (meal) => meal.title.toLowerCase().startsWith(
                  widget.searchText.toLowerCase(),
                ),
              )
              .toList();
    }

    return filtered;
  }


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: filteredMeals.length,
        itemBuilder: (context, index) {
          return MealPlanItem(mealModel: filteredMeals[index]);
        },
      ),
    );
  }
}

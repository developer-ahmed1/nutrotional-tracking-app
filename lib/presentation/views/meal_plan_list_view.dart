import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/core/theming/assets_data.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_item.dart';

class MealPlanListView extends StatelessWidget {
  const MealPlanListView({super.key});

  List<MealModel> getMeals() {
    return [
      MealModel(
        title: "Rice Porridge",
        image: AssetsData.ricePorridge,
        caloriesQuantity: 97,
        carbsQuantity: 16,
        proteinQuantity: 2.5,
        fatQuantity: 3.1,
      ),
      MealModel(
        title: "Avocado",
        image: AssetsData.avocado,
        caloriesQuantity: 160,
        carbsQuantity: 9,
        proteinQuantity: 2,
        fatQuantity: 15,
      ),
      MealModel(
        title: "Chicken",
        image: AssetsData.chicken,
        caloriesQuantity: 190,
        carbsQuantity: 0,
        proteinQuantity: 16,
        fatQuantity: 14,
      ),
      MealModel(
        title: "Eggs",
        image: AssetsData.eggs,
        caloriesQuantity: 155,
        carbsQuantity: 3,
        proteinQuantity: 13,
        fatQuantity: 4,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: getMeals().length,
        itemBuilder: (context, index) {
          return MealPlanItem(
            mealModel: getMeals()[index],
          );
        },
      ),
    );
  }
}

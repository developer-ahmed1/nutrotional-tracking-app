import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_detiles.dart';

class MealPlanItem extends StatelessWidget {
  const MealPlanItem({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.lighterShadow, // أسود شفاف (8% شفافية)
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(mealModel.image, height: 70),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(mealModel.title, style: TextStyles.bold15),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${mealModel.caloriesQuantity}",
                                style: TextStyles.bold15,
                              ),
                              TextSpan(
                                text: " kcal",
                                style: TextStyles.bold11_5,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Add",
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.add_circle, color: Colors.grey.shade400),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40),
                  child: Divider(color: Colors.grey.shade300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MealDetials(
                      title: 'Carbs',
                      quantity: mealModel.carbsQuantity,
                    ),
                    MealDetials(
                      title: 'Protein',
                      quantity: mealModel.proteinQuantity,
                    ),
                    MealDetials(title: 'Fats', quantity: mealModel.fatQuantity),
                    SizedBox(width: 7),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

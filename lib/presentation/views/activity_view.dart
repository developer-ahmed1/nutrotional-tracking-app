import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';
import 'package:nutrotional_tracking_app/presentation/cubits/cubit/add_meal_cubit.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_item.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedMeals = context.watch<AddMealCubit>().state;

    final totalCalories = selectedMeals.fold<num>(0, (sum, meal) => sum + meal.caloriesQuantity);
    final totalCarbs = selectedMeals.fold<num>(0, (sum, meal) => sum + meal.carbsQuantity);
    final totalProtein = selectedMeals.fold<num>(0, (sum, meal) => sum + meal.proteinQuantity);
    final totalFat = selectedMeals.fold<num>(0, (sum, meal) => sum + meal.fatQuantity);
    final totalMacros = totalCarbs + totalProtein + totalFat;

    double getPercentage(num value) => totalMacros == 0 ? 0 : (value / totalMacros * 100);

    final currentDate = DateFormat('MMMM, dd').format(DateTime.now()); // e.g., June, 30

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daily Activity', style: TextStyles.bold18),
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// 👇 Date Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(currentDate, style: TextStyles.bold16),
                IconButton(
                  icon: const Icon(Icons.calendar_today, color: AppColors.mainGreen),
                  onPressed: () {},
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// 👇 Pie Chart & Calories
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 180,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 50,
                        sectionsSpace: 4,
                        sections: [
                          PieChartSectionData(
                            color: Colors.pinkAccent,
                            value: getPercentage(totalCarbs),
                            title: '',
                            radius: 45,
                          ),
                          PieChartSectionData(
                            color: Colors.blueAccent,
                            value: getPercentage(totalProtein),
                            title: '',
                            radius: 45,
                          ),
                          PieChartSectionData(
                            color: Colors.amber,
                            value: getPercentage(totalFat),
                            title: '',
                            radius: 45,
                          ),
                          PieChartSectionData(
                            color: Colors.grey.shade400,
                            value: 100 - getPercentage(totalCarbs + totalProtein + totalFat),
                            title: '',
                            radius: 45,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text('${totalCalories.toStringAsFixed(0)} Total kcal', style: TextStyles.bold18),
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// 👇 Macro Breakdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _macroBox('Carbs', getPercentage(totalCarbs).toInt(), Colors.pinkAccent),
                _macroBox('Protein', getPercentage(totalProtein).toInt(), Colors.blueAccent),
                _macroBox('Fats', getPercentage(totalFat).toInt(), Colors.amber),
                _macroBox('Other', (100 - getPercentage(totalCarbs + totalProtein + totalFat)).toInt(), Colors.grey),
              ],
            ),

            const SizedBox(height: 20),

            /// 👇 Meal Sections
            ..._buildCategorySection('Breakfast', selectedMeals),
            ..._buildCategorySection('Lunch', selectedMeals),
            ..._buildCategorySection('Dinner', selectedMeals),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCategorySection(String category, List<MealModel> meals) {
    final filteredMeals = meals.where((meal) => meal.category == category).toList();
    if (filteredMeals.isEmpty) return [];

    return [
      Text(category, style: TextStyles.bold18),
      const SizedBox(height: 10),
      ...filteredMeals.map((meal) => MealPlanItem(mealModel: meal)).toList(),
      const SizedBox(height: 16),
    ];
  }

  Widget _macroBox(String label, int percentage, Color color) {
    return Column(
      children: [
        Text(
          '$percentage%',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: color),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade700),
        )
      ],
    );
  }
}

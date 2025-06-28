import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/presentation/views/meal_plan_list_view.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/category_button.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_appbar.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MealPlanAppBar(),
      backgroundColor: Color(0xfff4f5fa),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryButton(title: 'All', onPressed: () {}),
                CategoryButton(title: 'Breakfast', onPressed: () {}),
                CategoryButton(title: 'Lunch', onPressed: () {}),
                CategoryButton(title: 'Dinner', onPressed: () {}),
              ],
            ),
            const SizedBox(height: 12),
            MealPlanListView(),
          ],
        ),
      ),
    );
  }
}

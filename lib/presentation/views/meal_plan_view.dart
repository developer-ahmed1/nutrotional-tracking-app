import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_appbar.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MealPlanAppBar(),
      backgroundColor: Color(0xfff4f5fa),
      body: Center(child: Text("Meal Plan View")),
    );
  }
}

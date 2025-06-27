import 'package:flutter/material.dart';

class MealPlanView extends StatelessWidget {
  const MealPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Plan'),
      ),
      body: const Center(
        child: Text('Meal Plan View'),
      ),
    );
  }
}
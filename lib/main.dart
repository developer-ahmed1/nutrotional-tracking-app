import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/presentation/views/meal_plan_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MealPlanView(),
    );
  }
}


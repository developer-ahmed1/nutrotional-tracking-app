import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';
import 'package:nutrotional_tracking_app/presentation/cubits/cubit/add_meal_cubit.dart';

class AddMealButton extends StatelessWidget {
  final MealModel meal;
  const AddMealButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<AddMealCubit>();
    final isSelected = cubit.isMealSelected(meal);

    return GestureDetector(
      onTap: () => cubit.toggleMeal(meal),
      child:
          isSelected
              ? Row(
                children: [
                  Text("Remove", style: TextStyle(color: Colors.red.shade400)),
                  SizedBox(width: 8),
                  Icon(Icons.remove_circle, color: Colors.red.shade300),
                ],
              )
              : Row(
                children: [
                  Text("Add", style: TextStyle(color: Colors.grey.shade600)),
                  SizedBox(width: 8),
                  Icon(Icons.add_circle, color: Colors.grey.shade400),
                ],
              ),
    );
  }
}

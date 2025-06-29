import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';
import 'package:nutrotional_tracking_app/presentation/cubits/cubit/add_meal_cubit.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_item.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedMeals = context.watch<AddMealCubit>().state;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Daily Activity', style: TextStyles.bold18),
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Container()
    );
  }
}

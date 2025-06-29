import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class MealPlanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MealPlanAppBar({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('Meal Plan', style: TextStyles.bold18),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.search, color: AppColors.mainGreen),
          ),
        ),
      ],
    );
  }
}

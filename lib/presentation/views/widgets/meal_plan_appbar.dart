import 'package:flutter/material.dart';

class MealPlanAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MealPlanAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text(
        'Meal Plan',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      backgroundColor: Colors.white,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Color(0xff18ba7e)),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        elevation: 5,
        shadowColor: const Color.fromARGB(19, 78, 78, 78),
      ),
      child: Text(
        title,
        style: TextStyles.bold15.copyWith(
          color: isSelected ? AppColors.mainGreen : Colors.grey.shade500,
        ),
      ),
    );
  }
}

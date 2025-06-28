import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.white)),
      child: Text(
        title,
        style: TextStyles.bold15.copyWith(color: Colors.grey.shade500),
      ),
    );
  }
}
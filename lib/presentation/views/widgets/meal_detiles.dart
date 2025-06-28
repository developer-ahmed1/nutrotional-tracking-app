import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class MealDetials extends StatelessWidget {
  const MealDetials({super.key, required this.title, required this.quantity});

  final String title;
  final num quantity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title: ", style: TextStyle(color: Colors.grey.shade600)),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: "$quantity ", style: TextStyles.bold15),
              TextSpan(text: "g", style: TextStyles.bold13),
            ],
          ),
        ),
      ],
    );
  }
}

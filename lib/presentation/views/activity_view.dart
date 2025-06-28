import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Daily Activity',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Center(child: Text("Activity View")),
    );
  }
}

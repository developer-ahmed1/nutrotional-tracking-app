import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/styles.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({super.key});
  @override
  Widget build(BuildContext context) {

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

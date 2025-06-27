import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/assets_data.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_appbar.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/nav_icon.dart';

class MealPlanView extends StatefulWidget {
  const MealPlanView({super.key});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  int _selectedIndex = 0;
  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: onNavItemTapped,
        backgroundColor: Colors.white,
        overlayColor: WidgetStatePropertyAll(
          Color.fromARGB(255, 215, 239, 230),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: Color(0xff18ba7e));
          }
          return TextStyle(color: Colors.grey);
        }),
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: NavIcon(
              assetPath: AssetsData.mealIcon,
              isSelected: _selectedIndex == 0,
            ),
            label: 'Meal Plan',
          ),
          NavigationDestination(
            icon: NavIcon(
              assetPath: AssetsData.activityIcon,
              isSelected: _selectedIndex == 1,
            ),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: NavIcon(
              assetPath: AssetsData.profileIcon,
              isSelected: _selectedIndex == 2,
            ),
            label: 'Profile',
          ),
        ],
      ),
      appBar: const MealPlanAppBar(),
      body: const Center(child: Text('Meal Plan View')),
    );
  }
}

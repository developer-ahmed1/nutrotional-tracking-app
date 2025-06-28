import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/core/theming/assets_data.dart';
import 'package:nutrotional_tracking_app/presentation/views/activity_view.dart';
import 'package:nutrotional_tracking_app/presentation/views/meal_plan_view.dart';
import 'package:nutrotional_tracking_app/presentation/views/profile_view.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/nav_icon.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: onNavItemTapped,
        backgroundColor: Colors.white,
        overlayColor: WidgetStatePropertyAll(AppColors.lightGreen),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: AppColors.mainGreen);
          }
          return TextStyle(color: Colors.grey);
        }),
        indicatorColor: Colors.transparent,
        destinations: [
          NavigationDestination(
            icon: NavIcon(
              height: 32,

              assetPath: AssetsData.mealIcon,
              isSelected: _selectedIndex == 0,
            ),
            label: 'Meal Plan',
          ),
          NavigationDestination(
            icon: NavIcon(
              height: 28,
              assetPath: AssetsData.activityIcon,
              isSelected: _selectedIndex == 1,
            ),
            label: 'Activity',
          ),
          NavigationDestination(
            icon: NavIcon(
              height: 24,
              assetPath: AssetsData.profileIcon,
              isSelected: _selectedIndex == 2,
            ),
            label: 'Profile',
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [MealPlanView(), ActivityView(), ProfileView()],
      ),
    );
  }
}

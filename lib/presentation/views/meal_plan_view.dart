import 'package:flutter/material.dart';
import 'package:nutrotional_tracking_app/core/theming/app_colors.dart';
import 'package:nutrotional_tracking_app/presentation/views/meal_plan_list_view.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/category_button.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/meal_plan_appbar.dart';
import 'package:nutrotional_tracking_app/presentation/views/widgets/search_meal_appbar.dart';

class MealPlanView extends StatefulWidget {
  const MealPlanView({super.key});

  @override
  State<MealPlanView> createState() => _MealPlanViewState();
}

class _MealPlanViewState extends State<MealPlanView> {
  String selectedCategory = 'All';
  TextEditingController searchController = TextEditingController();

  String searchText = '';

  void onCategorySelected(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          isSearching
              ? SearchMealAppbar(
                onChanged: (String value) {
                  setState(() {
                    searchText = value;
                  });
                },
                searchController: searchController,
                clearButton: () {
                  setState(() {
                    searchController.clear();
                    searchText = '';
                  });
                },
                backButton: () {
                  setState(() {
                    isSearching = false;
                  });
                },
              )
              : MealPlanAppBar(
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                  });
                },
              ),
      backgroundColor: AppColors.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryButton(
                  title: 'All',
                  onPressed: () {
                    onCategorySelected('All');
                  },
                  isSelected: selectedCategory == 'All',
                ),
                CategoryButton(
                  title: 'Breakfast',
                  onPressed: () {
                    onCategorySelected('Breakfast');
                  },
                  isSelected: selectedCategory == 'Breakfast',
                ),
                CategoryButton(
                  title: 'Lunch',
                  onPressed: () {
                    onCategorySelected('Lunch');
                  },
                  isSelected: selectedCategory == 'Lunch',
                ),
                CategoryButton(
                  title: 'Dinner',
                  onPressed: () {
                    onCategorySelected('Dinner');
                  },
                  isSelected: selectedCategory == 'Dinner',
                ),
              ],
            ),
            const SizedBox(height: 12),
            MealPlanListView(
              selectedCategory: selectedCategory,
              searchText: searchText,
            ),
          ],
        ),
      ),
    );
  }
}

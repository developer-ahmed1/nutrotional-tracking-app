import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:nutrotional_tracking_app/core/constants/constant.dart';
import 'package:nutrotional_tracking_app/core/models/meal_model.dart';

class AddMealCubit extends Cubit<List<MealModel>> {
  AddMealCubit() : super([]) {
    loadMeals();
  }
  final Box<MealModel> box = Hive.box<MealModel>(kSelectedMeals);

  void toggleMeal(MealModel meal) {
    final currentList = [...state];
    if (currentList.contains(meal)) {
      currentList.remove(meal);
      box.delete(meal.title);
    } else {
      currentList.add(meal);
      box.put(meal.title, meal);
    }
    emit(currentList);
  }

  void loadMeals() {
    emit(box.values.toList());
  }

  bool isMealSelected(MealModel meal) {
    return state.contains(meal);
  }

  // To add meals to activity view
  // final selectedMeals = context.watch<AddMealCubit>().state;
}

import 'package:hive/hive.dart';
part 'meal_model.g.dart';

@HiveType(typeId: 0)
class MealModel extends HiveObject {
  
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final num caloriesQuantity;
  @HiveField(3)
  final num carbsQuantity;
  @HiveField(4)
  final num proteinQuantity;
  @HiveField(5)
  final num fatQuantity;
  @HiveField(6)
  final String category;

  MealModel({
    required this.title,
    required this.image,
    required this.caloriesQuantity,
    required this.carbsQuantity,
    required this.proteinQuantity,
    required this.fatQuantity,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MealModel &&
          runtimeType == other.runtimeType &&
          title == other.title;

  @override
  int get hashCode => title.hashCode;
}

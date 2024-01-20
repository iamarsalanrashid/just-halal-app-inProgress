import 'food.dart';

class Deal {
  final String id;
  final List<Food> foodItems;
  final double price;

  Deal({
    required this.id,
    required this.foodItems,
    required this.price,
  });
}

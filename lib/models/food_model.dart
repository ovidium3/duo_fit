// A class that represents a specific food item and its properties
class FoodModel {
  final String id;
  final String name;
  final int calories;
  int quantity;

  FoodModel({
    required this.id,
    required this.name,
    required this.calories,
    this.quantity = 1,
  });

  @override
  String toString() {
    return 'FoodModel(id: $id, name: $name, calories: $calories, quantity: $quantity)';
  }
}

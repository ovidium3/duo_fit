// A String extension that returns a boolean value to represent food's validity
extension FoodValidation on String {
  // Returns true if food name is at least 2 chars, false otherwise
  bool get isValidFoodName => length >= 2;

  // Returns true if calories is at least one digit, false otherwise
  bool get isValidCalories {
    if (length >= 1) {
      try {
        int.parse(this);
        return true;
      } catch (e) {
        return false;
      }
    }
    return false;
  }
}

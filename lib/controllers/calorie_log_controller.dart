import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/models/food_model.dart';

import 'dialog_controller.dart';

// Controller for handling all calorie log related functionality
class CalorieLogController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Dependency injection
  final DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController foodNameController, caloriesController;

  // Tab controller
  late TabController foodsTabController;

  // Get current user and firestore instance
  final User? _user = FirebaseAuth.instance.currentUser;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Firebase doc reference for user stats
  final DocumentReference statsDocRef = FirebaseFirestore.instance
      .collection('Users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .collection('userStatistics')
      .doc('stats');

  // Firebase doc reference for calorie log
  // final DocumentReference calorieLogDocRef = FirebaseFirestore.instance
  //     .collection('Users')
  //     .doc(FirebaseAuth.instance.currentUser?.uid)
  //     .collection('calorieLog')
  //     .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()));

  // Firebase doc reference for food items
  // final DocumentReference foodItemsDocRef = FirebaseFirestore.instance
  //     .collection('Users')
  //     .doc(FirebaseAuth.instance.currentUser?.uid)
  //     .collection('foodItems')
  //     .doc('items');

  // Formatted date for Firestore calorie log updating
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  // GetX state variables
  RxInt caloriesRemaining = RxInt(2000);
  RxInt caloriesGoal = RxInt(2000);
  RxList<FoodModel> foods = RxList([]);
  RxList<FoodModel> foodsEaten = RxList([]);

  // Get calorie goal from Firestore
  Future<void> getUserStatistics() async {
    final snapshot = await statsDocRef.get();
    if (snapshot.exists) {
      final data = snapshot.data() as Map<String, dynamic>;
      caloriesGoal.value = data['Target Calories'] as int;
    } else {
      caloriesRemaining.value = 5000; // arbitrary high value to indicate error
    }
  }

  // Gets the foods eaten for the current date
  Future<void> getFoodsEaten() async {
    final snapshot = await _firestore
        .collection('Users')
        .doc(_user?.uid)
        .collection('calorieLog')
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .get();
    if (snapshot.exists) {
      // Extract data from firestore
      final data = snapshot.data() as Map<String, dynamic>;
      // Update
      caloriesRemaining.value = data['totalCalories'] as int;
      final foodsData = data['foodsEaten'] as List<dynamic>;
      final consumedFoodsMap = <String, FoodModel>{};

      // Add foods from Firestore to foods eaten
      for (var food in foodsData) {
        // Extract all 3 data values for each food
        final foodName = food['name'] as String;
        final foodCalories = food['calories'] as int;
        final foodQuantity = food['quantity'] as int;

        if (consumedFoodsMap.containsKey(foodName)) {
          // Add one to existing food entry
          consumedFoodsMap[foodName]!.quantity += foodQuantity;
        } else {
          // Create a new entry for the food
          consumedFoodsMap[foodName] = FoodModel(
            id: UniqueKey().toString(),
            name: foodName,
            calories: foodCalories,
            quantity: foodQuantity,
          );
        }
      }
      // Update reactive foods list
      foodsEaten.value = consumedFoodsMap.values.toList();
    } else {
      // Set everything to a default state
      caloriesRemaining.value = caloriesGoal.value;
      foodsEaten.value = [];
      updateCalorieLog();
    }
  }

  // Extracts user's list of custom food items
  Future<void> getFoodItems() async {
    try {
      final snapshot = await _firestore
          .collection('Users')
          .doc(_user?.uid)
          .collection('foodItems')
          .doc('items')
          .get();

      if (snapshot.exists) {
        // Extract data from Firestore
        final data = snapshot.data() as Map<String, dynamic>;
        final foodItemsData = data['foods'] as List<dynamic>;

        // Update reactive foods list
        final items = foodItemsData
            .map((foodData) => FoodModel(
                  id: UniqueKey().toString(),
                  name: foodData['name'],
                  calories: foodData['calories'],
                ))
            .toList();
        foods.value = items;
      }
    } catch (error) {
      throw Exception(error);
    }
  }

  // Updates calorie and food eaten info for the day
  Future<void> updateCalorieLog() async {
    // Extract foods eaten info into a list
    final foodsData = foodsEaten.toList().map((food) {
      return {
        'name': food.name,
        'calories': food.calories,
        'quantity': food.quantity,
      };
    }).toList();
    // Update info in firestore
    await _firestore
        .collection('Users')
        .doc(_user?.uid)
        .collection('calorieLog')
        .doc(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .set({
      'date': formattedDate,
      'totalCalories': caloriesRemaining.value,
      'foodsEaten': foodsData,
    });
  }

  // Adds food to list of foods eaten for the day
  void addFoodToEaten(FoodModel food) {
    caloriesRemaining -= food.calories;
    final existingFoodIndex =
        foodsEaten.indexWhere((item) => item.name == food.name);

    if (existingFoodIndex != -1) {
      // Add one to food count if count > 1
      foodsEaten[existingFoodIndex].quantity++;
    } else {
      // Add a new food with a default count of 1
      foodsEaten.add(FoodModel(
        id: UniqueKey().toString(),
        name: food.name,
        calories: food.calories,
        quantity: 1,
      ));
    }
    updateCalorieLog();
  }

  // Removes food from list of foods eaten for the day
  void removeFoodFromEaten(FoodModel food) {
    final existingFoodIndex =
        foodsEaten.indexWhere((item) => item.name == food.name);

    if (existingFoodIndex != -1) {
      // Reduce food count if more than 1
      if (foodsEaten[existingFoodIndex].quantity > 1) {
        foodsEaten[existingFoodIndex].quantity--;
      } else {
        // Remove current food entirely
        foodsEaten.removeAt(existingFoodIndex);
      }
      caloriesRemaining += food.calories;
    }
    updateCalorieLog();
  }

  // Add food item to user's food items list
  Future<void> addCustomFoodItem() async {
    // Get food info from input controllers
    String foodName = foodNameController.text;
    int calories = int.parse(caloriesController.text);
    final docRef = _firestore
        .collection('Users')
        .doc(_user?.uid)
        .collection('foodItems')
        .doc('items');
    try {
      final snapshot = await docRef.get();

      if (snapshot.exists) {
        // Extract data from Firestore to get food list
        List<dynamic> existingFoods = snapshot.data()?['foods'] ?? [];
        final newFood = {
          'name': foodName,
          'calories': calories,
        };

        // Add new food and update food list in Firestore
        existingFoods.add(newFood);
        await docRef.update({
          'foods': existingFoods,
        });
      } else {
        // If no foods are in food list, set food list as current food item
        await docRef.set({
          'foods': [
            {'name': foodName, 'calories': calories}
          ]
        });
      }
      // Re-initialize food lists for UI display
      await getFoodItems();
    } catch (error) {
      throw Exception(error);
    }
  }

  // Remove food item from user's food items list
  Future<void> removeCustomFoodItem(FoodModel food) async {
    final docRef = _firestore
        .collection('Users')
        .doc(_user?.uid)
        .collection('foodItems')
        .doc('items');
    try {
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        // Extract food list data from Firestore and remove food
        List<dynamic> existingFoods = docSnapshot.data()?['foods'] ?? [];
        existingFoods
            .removeWhere((existingFood) => existingFood['name'] == food.name);

        // Update foods list in Firestore
        await docRef.update({
          'foods': existingFoods,
        });

        // Remove food from reactive food list
        foods.remove(food);
      }
      // Update foods in UI
      await getFoodItems();
    } catch (error) {
      throw Exception(error);
    }
  }

  // Function that calls dialog controller to show edit foods dialog
  void editFoods() {
    dialogController.showEditFoods(
      foodNameController,
      caloriesController,
      addCustomFoodItem,
      removeCustomFoodItem,
      foods.toList(),
    );
  }

  @override
  void onInit() async {
    // Input controller creation
    foodNameController = TextEditingController();
    caloriesController = TextEditingController();

    // Tab controller creation
    foodsTabController = TabController(vsync: this, length: 2);

    // Get necessary info to set up page
    await getUserStatistics();
    await getFoodsEaten();
    await getFoodItems();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    foodNameController.dispose();
    caloriesController.dispose();

    // Tab controller disposal
    foodsTabController.dispose();
    super.onClose();
  }
}

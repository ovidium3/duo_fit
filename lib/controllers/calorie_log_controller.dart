import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '/models/food_model.dart';

import 'dialog_controller.dart';

class CalorieLogController extends GetxController {
  // Dependency injection
  final DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController foodNameController, caloriesController;

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
        final foodName = food['name'] as String;
        final foodCalories = food['calories'] as int;
        final foodQuantity = food['quantity'] as int;

        if (consumedFoodsMap.containsKey(foodName)) {
          consumedFoodsMap[foodName]!.quantity += foodQuantity;
        } else {
          consumedFoodsMap[foodName] = FoodModel(
            id: UniqueKey().toString(),
            name: foodName,
            calories: foodCalories,
            quantity: foodQuantity,
          );
        }
      }
      foodsEaten.value = consumedFoodsMap.values.toList();
    } else {
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
        final data = snapshot.data() as Map<String, dynamic>;

        final foodItemsData = data['foods'] as List<dynamic>;
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
      foodsEaten[existingFoodIndex].quantity++;
    } else {
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
      if (foodsEaten[existingFoodIndex].quantity > 1) {
        foodsEaten[existingFoodIndex].quantity--;
      } else {
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
        List<dynamic> existingFoods = snapshot.data()?['foods'] ?? [];
        final newFood = {
          'name': foodName,
          'calories': calories,
        };
        existingFoods.add(newFood);

        await docRef.update({
          'foods': existingFoods,
        });
      } else {
        await docRef.set({
          'foods': [
            {'name': foodName, 'calories': calories}
          ]
        });
      }
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
        List<dynamic> existingFoods = docSnapshot.data()?['foods'] ?? [];
        existingFoods
            .removeWhere((existingFood) => existingFood['name'] == food.name);

        await docRef.update({
          'foods': existingFoods,
        });

        foods.remove(food);
      }
      await getFoodItems();
    } catch (error) {
      throw Exception(error);
    }
  }

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
    super.onClose();
  }
}

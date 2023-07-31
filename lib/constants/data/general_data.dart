import 'package:flutter/material.dart';

import '/models/goal_card_model.dart';
import '/models/workout_model.dart';
import 'workout_data.dart';

class DataConstants {
  // Get started goal cards
  static final List<GoalCard> goalCardsList = [
    GoalCard(
      title: "Build Muscle",
      description: "Our workout routines will help you build muscle",
      id: 0,
    ),
    GoalCard(
      title: "Lose Weight",
      description:
          "Our customized diet plans will support your weight loss journey",
      id: 1,
    ),
    GoalCard(
      title: "Look Your Best",
      description: "Together, we will help you achieve your best physique",
      id: 2,
    ),
  ];

  // Workout tabs
  static final List<Tab> workoutTabs = <Tab>[
    const Tab(text: 'Popular'),
    const Tab(text: 'Upper Body'),
    const Tab(text: 'Lower Body'),
    const Tab(text: 'Full Body'),
    const Tab(text: 'Extras'),
  ];

  // List of top 3 popular workouts
  static final List<WorkoutModel> popularWorkouts = [
    WorkoutData.push,
    WorkoutData.pull,
    WorkoutData.legs,
  ];

  // List of top 3 upper body workouts
  static final List<WorkoutModel> upperBodyWorkouts = [
    WorkoutData.upperBody,
    WorkoutData.push,
    WorkoutData.pull,
  ];

  // List of top 3 lower body workouts
  static final List<WorkoutModel> lowerBodyWorkouts = [
    WorkoutData.legs,
  ];

  // List of top 3 full body workouts
  static final List<WorkoutModel> fullBodyWorkouts = [
    WorkoutData.fullBody,
  ];

  // List of top 3 extra workouts
  static final List<WorkoutModel> extraWorkouts = [
    WorkoutData.arms,
    WorkoutData.abs,
    WorkoutData.shoulders,
  ];

  // Workout details tabs
  static final List<Tab> workoutDetailsTabs = <Tab>[
    const Tab(text: "Description"),
    const Tab(text: "Reviews"),
    const Tab(text: 'Comments'),
  ];
}

import 'package:flutter/material.dart';

import '/constants/text/app_texts.dart';
import '/models/goal_card_model.dart';
import '/models/workout_model.dart';

import 'workout_data.dart';

class DataConstants {
  // Get started goal cards
  static final List<GoalCard> goalCardsList = [
    GoalCard(
      title: TextConstants.goalCardTitle1,
      description: TextConstants.goalCardDescription1,
      id: 0,
    ),
    GoalCard(
      title: TextConstants.goalCardTitle2,
      description: TextConstants.goalCardDescription2,
      id: 1,
    ),
    GoalCard(
      title: TextConstants.goalCardTitle3,
      description: TextConstants.goalCardDescription3,
      id: 2,
    ),
  ];

  // User profile statistic titles
  static final List<String> profileStatTitles = [
    TextConstants.profileStat1,
    TextConstants.profileStat2,
    TextConstants.profileStat3,
  ];

  // Food tab titles
  static final List<Tab> foodTabs = <Tab>[
    const Tab(text: TextConstants.yourFoods),
    const Tab(text: TextConstants.foodsEaten),
  ];

  // Workout tab titles
  static final List<Tab> workoutTabs = <Tab>[
    const Tab(text: TextConstants.workoutTab1),
    const Tab(text: TextConstants.workoutTab2),
    const Tab(text: TextConstants.workoutTab3),
    const Tab(text: TextConstants.workoutTab4),
  ];

  // List of 2 popular workouts
  static final List<WorkoutModel> popularWorkouts = [
    WorkoutData.push,
    WorkoutData.pull,
  ];

  // List of 2 minimalist workouts
  static final List<WorkoutModel> minimalistWorkouts = [
    WorkoutData.fullBody,
    WorkoutData.shoulders,
  ];

  // List of 2 essential workouts
  static final List<WorkoutModel> essentialWorkouts = [
    WorkoutData.upperBody,
    WorkoutData.legs,
  ];

  // List of 2 extra workouts
  static final List<WorkoutModel> extraWorkouts = [
    WorkoutData.arms,
    WorkoutData.abs,
  ];
}

import 'package:flutter/material.dart';

import '/constants/text/general_texts.dart';
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

  // Workout tab titles
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

  // List of lower body workouts
  static final List<WorkoutModel> lowerBodyWorkouts = [
    WorkoutData.legs,
  ];

  // List of full body workouts
  static final List<WorkoutModel> fullBodyWorkouts = [
    WorkoutData.fullBody,
  ];

  // List of extra workouts
  static final List<WorkoutModel> extraWorkouts = [
    WorkoutData.arms,
    WorkoutData.abs,
    WorkoutData.shoulders,
  ];
}

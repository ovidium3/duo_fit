import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/models/workout_model.dart';

import 'exercise_cell.dart';

// Creates a list view of exercise cells based on the given workout
class ExerciseList extends StatelessWidget {
  final WorkoutModel workout;

  const ExerciseList({
    required this.workout,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollbarTheme(
      data: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(ColorConstants.primaryColor),
      ),
      child: ListView.separated(
        padding: const EdgeInsets.all(5),
        itemCount: workout.exerciseDataList.length,
        itemBuilder: (context, index) {
          return ExerciseCell(
            currentExercise: workout.exerciseDataList[index],
          );
        },
        // Space between exercise cells
        separatorBuilder: (context, index) {
          return const SizedBox(height: 15);
        },
      ),
    );
  }
}

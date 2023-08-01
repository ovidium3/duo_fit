import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/helpers/show_delay_mixin.dart';
import '/models/workout_model.dart';
import '/screens/workout/workout_page.dart';
import '/widgets/buttons/auth_button.dart';

import 'components/details_app_bar.dart';
import 'components/exercise_list.dart';
import 'components/workout_detail_display_widget.dart';

// Workout details page where user can then start workout from
// ignore: must_be_immutable
class WorkoutDetailsPage extends StatelessWidget with ShowDelayMixin {
  WorkoutDetailsPage({
    required this.workout,
    super.key,
  });

  final WorkoutModel workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: DetailsAppBar(text: TextConstants.workoutDetails),
      ),
      body: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: .7,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                workout.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0, 0.2, 0.4, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorConstants.darkBlue,
                  ColorConstants.darkBlue.withOpacity(0.05),
                  ColorConstants.darkBlue,
                  ColorConstants.darkBlue,
                ],
              ),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Space between app bar and workout duration / exercises
                  const SizedBox(height: 20),

                  // Workout duration / exercises
                  DelayedDisplay(
                    delay: showDelay(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        WorkoutDetailDisplay(text: workout.duration),
                        const SizedBox(width: 10),
                        WorkoutDetailDisplay(
                          text: workout.exercises,
                          isTime: false,
                        ),
                      ],
                    ),
                  ),

                  // Space between workout duration / exercises and workout name
                  const Spacer(),

                  // Workout name
                  DelayedDisplay(
                    delay: showDelay(),
                    child: Text(
                      workout.title,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.textWhite,
                      ),
                    ),
                  ),

                  // Space between workout name and exercise list
                  const SizedBox(height: 30),

                  // Exercise list
                  SizedBox(
                    height: 300,
                    child: DelayedDisplay(
                      delay: showDelay(),
                      child: Center(
                        child: ExerciseList(workout: workout),
                      ),
                    ),
                  ),

                  // Space between tab bar content and start workout button
                  const SizedBox(height: 20),

                  // Start workout button
                  DelayedDisplay(
                    delay: showDelay(),
                    child: AuthButton(
                      onPressed: () {
                        print('button pressed');
                        Get.to(WorkoutPage(workout: workout));
                      },
                      text: TextConstants.startWorkout,
                      isOutlined: false,
                    ),
                  ),

                  // Bottom padding
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

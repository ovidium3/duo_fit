import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/models/exercise_model.dart';

import 'components/app_bar.dart';
//import 'components/exercise_details_video.dart';
import 'components/exercise_step.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDetailsPage({required this.exercise, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(text: TextConstants.exerciseDetails),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: ColorConstants.darkBlue,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Video player
                // Container(
                //   height: 264,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(20),
                //       color: ColorConstants.darkBlue),
                //   child: ExerciseDetailsVideo(
                //     exercise: exercise,
                //   ),
                // ),

                // Space between video player and rest of page text
                const SizedBox(height: 8),

                // Rest of page text
                Expanded(
                  child: ListView(
                    children: [
                      // Exercise title
                      Text(
                        exercise.title,
                        style: const TextStyle(
                          color: ColorConstants.textWhite,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Space between exercise title and exercise description
                      const SizedBox(height: 9),

                      // Exercise description
                      Text(
                        exercise.description,
                        style: const TextStyle(
                          color: ColorConstants.textWhite,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      // Space between exercise description and exercise steps
                      const SizedBox(height: 30),

                      // Exercise steps
                      Column(
                        children: [
                          for (int i = 0; i < exercise.steps.length; i++) ...[
                            ExerciseStep(
                                number: "${i + 1}",
                                description: exercise.steps[i]),
                            const SizedBox(height: 20),
                          ],
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

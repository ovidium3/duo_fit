import 'package:flutter/material.dart';

import '/constants/color_constants.dart';

import 'finish_button.dart';
import 'rest_timer.dart';
import 'workout_timer.dart';

// App bar that displays workout timer, rest timer, and finish button
class WorkoutAppBar extends StatelessWidget {
  final Function() onTap;

  const WorkoutAppBar({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const WorkoutTimer(),
      centerTitle: true,
      leadingWidth: 80,
      toolbarHeight: 40,
      iconTheme: const IconThemeData(color: ColorConstants.iconWhite),
      backgroundColor: ColorConstants.transparent,
      elevation: 0,
      leading: RestTimerButton(
        title: 'Timer',
        isEnabled: false,
        onTimerChanged: (newTimerValue) {},
      ),
      actions: [
        // Finish button
        FinishButton(
          onFinish: () {
            onTap();
          },
        ),

        // Space between finish button and right side
        const SizedBox(width: 15),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '../../workout_details/workout_details_page.dart';

class WorkoutCard extends StatelessWidget {
  WorkoutCard({
    required this.title,
    required this.imagePath,
    required this.listCollection,
    required this.index,
    super.key,
  });

  String title;
  String imagePath;
  List listCollection;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(WorkoutDetailsPage(
          workoutTitle: title,
          overlayedImg: imagePath,
          timeLeftInHour: "?",
          movesNumber: "?",
          setsNumber: "?",
          durationInMinutes: "?",
          description: "?",
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: ColorConstants.darkBlue,
                width: 130,
                height: 130,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: ColorConstants.textWhite.withOpacity(0.75),
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/models/exercise_model.dart';
import '/models/set_model.dart';

import 'set_row.dart';

// Exercise card display with header and rows of data for each set
class ExerciseCard extends StatefulWidget {
  final ExerciseModel exercise;
  final List<SetModel> setDataList;

  const ExerciseCard({
    required this.exercise,
    required this.setDataList,
    super.key,
  });

  @override
  ExerciseCardState createState() => ExerciseCardState();
}

class ExerciseCardState extends State<ExerciseCard> {
  // Set completion bool to pass to set row to trigger set completion events
  bool isSetComplete = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exercise title
          ListTile(
            title: Text(
              widget.exercise.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: ColorConstants.textWhite,
              ),
            ),
          ),

          // Row containing set data headers like set, reps, etc.
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Set header
                Expanded(
                  flex: 1,
                  child: Text(
                    'Set',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),

                // Previous data header
                Expanded(
                  flex: 2,
                  child: Text(
                    'Previous',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),

                // Load header
                Expanded(
                  flex: 1,
                  child: Text(
                    'Load',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),

                // Reps header
                Expanded(
                  flex: 1,
                  child: Text(
                    'Reps',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),

                // Check mark box
                Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.check,
                      color: ColorConstants.iconWhite,
                    )),
              ],
            ),
          ),

          // Space between set data headers and set data rows
          const SizedBox(height: 8),

          // Set data rows
          for (final setData in widget.setDataList) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SetRow(
                setData: setData,
                onSetCompleteChanged: (value) {
                  setState(() {
                    isSetComplete = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }
}

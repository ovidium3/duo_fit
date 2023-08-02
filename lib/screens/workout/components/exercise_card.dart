import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '/controllers/workout_controller.dart';
import '/constants/color_constants.dart';
import '/models/exercise_model.dart';
import '/models/set_model.dart';

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
  bool isSetComplete = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.darkBlue,
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

class SetRow extends StatefulWidget {
  final SetModel setData;
  final Function(bool) onSetCompleteChanged;

  const SetRow({
    required this.setData,
    required this.onSetCompleteChanged,
    super.key,
  });

  @override
  SetRowState createState() => SetRowState();
}

class SetRowState extends State<SetRow> {
  // Dependency injection
  final WorkoutController workoutController = Get.put(WorkoutController());

  bool isSetComplete = false;

  // Input controllers
  final TextEditingController _loadController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();

  // Input focus nodes
  FocusNode loadFocusNode = FocusNode();
  FocusNode repsFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _loadController.text = widget.setData.load?.toString() ?? '';
    _repsController.text = widget.setData.reps?.toString() ?? '';
    isSetComplete = widget.setData.isComplete;
  }

  @override
  void dispose() {
    _loadController.dispose();
    _repsController.dispose();
    loadFocusNode.dispose();
    repsFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //contentPadding: const EdgeInsets.only(left: 30, right: 15),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Set type
          Expanded(
            flex: 1,
            child: SizedBox.square(
              dimension: 20,
              child: Center(
                child: Text(
                  widget.setData.setType,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: _getSetTypeColor(widget.setData.setType),
                  ),
                ),
              ),
            ),
          ),

          // Previous data
          Expanded(
            flex: 2,
            child: Text(
              (widget.setData.previousData.contains("-"))
                  ? "-"
                  : widget.setData.previousData,
              style: const TextStyle(
                fontSize: 12,
                color: ColorConstants.textWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          // Load
          Expanded(
            flex: 1,
            child: Container(
              height: 24,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: _loadController,
                focusNode: loadFocusNode,
                onChanged: (value) {
                  widget.setData.load = double.tryParse(value);
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  LengthLimitingTextInputFormatter(5),
                ],
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorConstants.textWhite,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: widget.setData.previousData
                      .substring(0, widget.setData.previousData.indexOf('x')),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintStyle: const TextStyle(color: ColorConstants.textWhite),
                ),
              ),
            ),
          ),

          // Reps
          Expanded(
            flex: 1,
            child: Container(
              height: 24,
              width: 50,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: TextField(
                controller: _repsController,
                focusNode: repsFocusNode,
                onChanged: (value) {
                  widget.setData.reps = int.tryParse(value);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                style: const TextStyle(
                  fontSize: 12,
                  color: ColorConstants.textWhite,
                ),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: widget.setData.previousData.contains('(')
                      ? widget.setData.previousData.substring(
                          widget.setData.previousData.indexOf('x') + 1,
                          widget.setData.previousData.indexOf('('))
                      : widget.setData.previousData.substring(
                          widget.setData.previousData.indexOf('x') + 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  hintStyle: const TextStyle(color: ColorConstants.textWhite),
                ),
              ),
            ),
          ),

          // Check mark button
          RawMaterialButton(
            onPressed: () {
              if (_repsController.text.isNotEmpty &&
                  _loadController.text.isNotEmpty) {
                setState(() {
                  isSetComplete = !isSetComplete;
                  widget.onSetCompleteChanged(isSetComplete);
                  final setData = {
                    'id': widget.setData.exerciseTitle,
                    'setDataList': [
                      {
                        'previousData': _createUpdatedData(_loadController.text,
                            _repsController.text, widget.setData.setType),
                        'setType': widget.setData.setType,
                      }
                    ],
                  };
                  if (isSetComplete) {
                    workoutController.completeSet(setData);
                  }
                });
              }
            },
            constraints: const BoxConstraints.tightFor(
              width: 32,
              height: 24,
            ),
            child: Container(
              width: 32,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                color: isSetComplete
                    ? ColorConstants.green
                    : ColorConstants.disabled,
              ),
              child: const Icon(
                Icons.check,
                color: ColorConstants.iconWhite,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _createUpdatedData(String load, String reps, String setType) {
    if (setType == 'W' || setType == 'F') {
      return "${load}x$reps($setType)";
    } else {
      return "${load}x$reps";
    }
  }

  Color _getSetTypeColor(String setType) {
    switch (setType) {
      case 'W':
        return ColorConstants.warmUpSet;
      default:
        return ColorConstants.workingSet;
    }
  }
}

import '/models/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/services.dart';
import '/constants/color_constants.dart';
import '/models/set_model.dart';
import '/helpers/time_service.dart';

class ExerciseCard extends StatefulWidget {
  final ExerciseModel exercise;
  final List<SetModel> setDataList;

  const ExerciseCard({
    required this.exercise,
    required this.setDataList,
    Key? key,
  }) : super(key: key);

  @override
  ExerciseCardState createState() => ExerciseCardState();
}

class ExerciseCardState extends State<ExerciseCard> {
  bool isSetComplete = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              widget.exercise.title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    'Set',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    'Previous',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Load',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    'Reps',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(flex: 1, child: Icon(Icons.check)),
              ],
            ),
          ),
          const SizedBox(height: 8),
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
                addToSetList: addToSetList,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ],
      ),
    );
  }

  void addToSetList(Map<String, dynamic> formattedData) {
    final setListData = SetListData();
    setListData.addToSetList(formattedData);
  }
}

class SetRow extends StatefulWidget {
  final SetModel setData;
  final Function(bool) onSetCompleteChanged;
  final Function(Map<String, dynamic>) addToSetList;

  const SetRow({
    required this.setData,
    required this.onSetCompleteChanged,
    required this.addToSetList,
    Key? key,
  }) : super(key: key);

  @override
  SetRowState createState() => SetRowState();
}

class SetRowState extends State<SetRow> {
  bool isSetComplete = false;

  final TextEditingController _loadController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context)
            .unfocus(); // Clears focus from any focused input field
      },
      child: ListTile(
        //contentPadding: const EdgeInsets.only(left: 30, right: 15),
        leading: InkWell(
          onTap: () {
            _showExerciseTypePopup(context);
          },
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                (widget.setData.previousData.contains("-"))
                    ? "-"
                    : widget.setData.previousData,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
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
                    FilteringTextInputFormatter.allow(
                        RegExp(r'^\d+\.?\d{0,2}')),
                    LengthLimitingTextInputFormatter(5),
                  ],
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: widget.setData.previousData
                        .substring(0, widget.setData.previousData.indexOf('x')),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
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
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: widget.setData.previousData.contains('(')
                        ? widget.setData.previousData.substring(
                            widget.setData.previousData.indexOf('x') + 1,
                            widget.setData.previousData.indexOf('('))
                        : widget.setData.previousData.substring(
                            widget.setData.previousData.indexOf('x') + 1),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
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
                          'previousData': _createUpdatedData(
                              _loadController.text,
                              _repsController.text,
                              widget.setData.setType),
                          'setType': widget.setData.setType,
                        }
                      ],
                    };
                    if (isSetComplete) {
                      _showTimerPopup(context);
                      widget.addToSetList(setData);
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
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
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

  void _showExerciseTypePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: const Text('Warm-Up'),
                onTap: () {
                  setState(() {
                    widget.setData.setType = 'W';
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Failure'),
                onTap: () {
                  setState(() {
                    widget.setData.setType = 'F';
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showTimerPopup(BuildContext context) {
    final ValueNotifier<int> timerDuration = ValueNotifier(120);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // ignore: no_leading_underscores_for_local_identifiers
        final CountDownController _controller = CountDownController();

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            void skipTimer() {
              setState(() {
                isSetComplete = true;
                widget.setData.isComplete = true;
              });
              Navigator.of(context).pop();
            }

            void addTime(int seconds) {
              var currDuration = MinutesSeconds(minutes: 0, seconds: 0);
              try {
                currDuration = MinutesSeconds(
                    minutes: int.parse(_controller.getTime()!.substring(0, 2)),
                    seconds: int.parse(_controller.getTime()!.substring(3)));
              } catch (e) {
                // if timer < 60 seconds
                currDuration = MinutesSeconds(
                    seconds: int.parse(_controller.getTime()!), minutes: 0);
              }
              final currentDuration = Duration(
                  seconds: currDuration.seconds + (currDuration.minutes * 60));
              final newDuration = currentDuration + Duration(seconds: seconds);
              if (newDuration.inSeconds >= 0 &&
                  newDuration.inSeconds <= timerDuration.value) {
                _controller.restart(duration: newDuration.inSeconds);
              } else if (newDuration.inSeconds < 0) {
                _controller.restart(duration: 0);
              } else {
                _controller.restart(duration: timerDuration.value);
              }
            }

            _controller.restart(duration: timerDuration.value);

            return AlertDialog(
              title: const Center(child: Text('Rest Timer')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularCountDownTimer(
                    width: 150,
                    height: 150,
                    strokeWidth: 10,
                    fillColor: ColorConstants.green,
                    ringColor: ColorConstants.disabled,
                    duration: timerDuration.value,
                    isReverse: true,
                    isReverseAnimation: true,
                    controller: _controller,
                    textStyle: const TextStyle(
                      fontSize: 36,
                      color: ColorConstants.textWhite,
                      fontWeight: FontWeight.bold,
                    ),
                    onComplete: () {
                      setState(() {
                        isSetComplete = true;
                        widget.setData.isComplete = true;
                      });
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () => addTime(-9),
                        child: const Text('-10s'),
                      ),
                      ElevatedButton(
                        onPressed: () => addTime(11),
                        child: const Text('+10s'),
                      ),
                      ElevatedButton(
                        onPressed: skipTimer,
                        child: const Text('Skip'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Color _getSetTypeColor(String setType) {
    switch (setType) {
      case 'W':
        return Colors.yellow;
      case 'F':
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}

class SetListData {
  static final SetListData _instance = SetListData._internal();

  factory SetListData() {
    return _instance;
  }

  SetListData._internal();

  List<Map<String, dynamic>> masterSetList = [];

  void addToSetList(Map<String, dynamic> setData) {
    masterSetList.add(setData);
  }

  List<Map<String, dynamic>> getSetList() {
    return masterSetList;
  }
}

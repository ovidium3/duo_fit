import 'dart:async';

import 'package:flutter/material.dart';

class WorkoutTimer extends StatefulWidget {
  const WorkoutTimer({Key? key}) : super(key: key);

  @override
  WorkoutTimerState createState() => WorkoutTimerState();
}

class WorkoutTimerState extends State<WorkoutTimer> {
  late Timer _timer;
  late int _secondsElapsed;

  @override
  void initState() {
    super.initState();
    _secondsElapsed = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        _secondsElapsed++;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final minutes = _secondsElapsed ~/ 60;
    final seconds = _secondsElapsed % 60;

    return Text(
      '$minutes:${seconds.toString().padLeft(2, '0')}',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

import '/constants/color_constants.dart';
import '/models/exercise_model.dart';

class ExerciseDetailsVideo extends StatefulWidget {
  const ExerciseDetailsVideo({required this.exercise, super.key});

  final ExerciseModel exercise;

  @override
  ExerciseDetailsVideoState createState() => ExerciseDetailsVideoState();
}

class ExerciseDetailsVideoState extends State<ExerciseDetailsVideo> {
  late VideoPlayerController _controller;
  late ChewieController _chewieController;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(widget.exercise.video);

    _controller.initialize();

    _chewieController = ChewieController(
        videoPlayerController: _controller,
        looping: true,
        autoPlay: true,
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        aspectRatio: 15 / 10,
        placeholder: const Center(child: CupertinoActivityIndicator()),
        materialProgressColors:
            ChewieProgressColors(playedColor: ColorConstants.primaryColor));
    super.initState();
  }

  @override
  void dispose() {
    // Controller dispose method
    _controller.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _controller.value.aspectRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Theme(
            data: Theme.of(context).copyWith(platform: TargetPlatform.android),
            child: Chewie(controller: _chewieController)),
      ),
    );
  }
}

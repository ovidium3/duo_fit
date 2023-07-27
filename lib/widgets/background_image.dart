import 'package:flutter/material.dart';

import '/constants/media_constants.dart';

// Background image (randomly generated) widget that covers the entire screen
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        MediaConstants().randomFromAssetsList(),
        fit: BoxFit.cover, // Prevents image distortion
      ),
    );
  }
}

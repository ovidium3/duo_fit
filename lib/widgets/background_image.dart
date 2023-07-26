import 'package:flutter/material.dart';

import 'package:duo_fit/constants/media_constants.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        MediaConstants().randomFromAssetsList(),
        fit: BoxFit.cover,
      ),
    );
  }
}

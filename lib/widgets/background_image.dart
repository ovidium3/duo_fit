import 'package:flutter/material.dart';

import 'package:duo_fit/constants/image_path_constants.dart';

class BackgroundImage extends StatelessWidget {
  final String? backgroundImage;

  const BackgroundImage({
    this.backgroundImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        backgroundImage ?? ImgSrc().randomFromAssetsList(),
        fit: BoxFit.cover,
      ),
    );
  }
}

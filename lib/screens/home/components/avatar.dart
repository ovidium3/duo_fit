import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/constants/color_constants.dart';
import '/constants/media_constants.dart';

// Profile picture avatar on home page
class Avatar extends StatelessWidget {
  final void Function()? onProfileImgTap;
  final String networkImage;

  const Avatar({
    required this.onProfileImgTap,
    required this.networkImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onProfileImgTap,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
        ),
        width: 50,
        height: 50,
        child: Image(
          image: NetworkImage(networkImage),
          fit: BoxFit.cover,

          // If image not available, show default profile
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: ColorConstants.error,
              child: Image.asset(MediaConstants.defaultProfile),
            );
          },

          // While image loads, show loading animation
          frameBuilder: (_, image, loadingBuilder, __) {
            if (loadingBuilder == null) {
              return SizedBox(
                height: 300,
                child: Center(
                  child: SpinKitSpinningLines(
                    color: Theme.of(context).primaryColor,
                    duration: const Duration(seconds: 1),
                    size: 40,
                  ),
                ),
              );
            }
            return image;
          },
        ),
      ),
    );
  }
}

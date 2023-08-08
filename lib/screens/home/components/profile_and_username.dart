import 'package:flutter/material.dart';

import '/constants/text/app_texts.dart';
import '/constants/color_constants.dart';
import 'avatar.dart';

// Username and profile text display on home page
class ProfileAndUsername extends StatelessWidget {
  final String username;
  final String profileImage;
  final void Function()? onProfileImageTap;

  const ProfileAndUsername({
    required this.username,
    required this.profileImage,
    this.onProfileImageTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Hey, name
        RichText(
          // Hey text
          text: TextSpan(
            text: TextConstants.hey,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),

            // Username text
            children: [
              TextSpan(
                text: username,
                style: const TextStyle(
                  color: ColorConstants.textWhite,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),

        // Profile picture
        Avatar(
          onProfileImgTap: onProfileImageTap,
          networkImage: profileImage,
        ),
      ],
    );
  }
}

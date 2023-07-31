import 'package:flutter/material.dart';

import '/constants/text/general_texts.dart';
import '/constants/color_constants.dart';
import 'avatar.dart';

// Username and profile display on home page
class ProfileAndUsername extends StatelessWidget {
  const ProfileAndUsername({
    required this.username,
    required this.profileImage,
    this.onProfileImageTap,
    super.key,
  });

  final String username;
  final String profileImage;
  final void Function()? onProfileImageTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Hey, name
        RichText(
          text: TextSpan(
            text: TextConstants.hey,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
              fontSize: 25,
            ),
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

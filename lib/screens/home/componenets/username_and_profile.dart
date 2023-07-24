import 'package:flutter/material.dart';

import '../../../constants/text_constants/general_text_constants.dart';
import 'avatar.dart';

class ProfileAndUsername extends StatelessWidget {
  ProfileAndUsername({
    required this.username,
    required this.profileImg,
    this.onProfileImgTap,
    super.key,
  });

  String username;
  String profileImg;
  void Function()? onProfileImgTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
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
                text: ' $username',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        Avatar(
          onProfileImgTap: onProfileImgTap,
          networkImage: profileImg,
        ),
      ],
    );
  }
}
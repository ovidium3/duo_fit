import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/controllers/auth/sign_out_controller.dart';

// App bar used for navigating back / logging out from profile pages
class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        TextConstants.profile,
        style: TextStyle(
          color: ColorConstants.textWhite,
          fontSize: 25,
        ),
      ),
      toolbarHeight: 80,
      iconTheme: const IconThemeData(color: ColorConstants.iconWhite),
      actions: [
        // Sign out button
        GetBuilder<SignOutController>(
          init: SignOutController(),
          builder: (signOutController) {
            return ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.backgroundColor,
                  elevation: 0),
              label: const Text(
                TextConstants.signOut,
                style: TextStyle(color: ColorConstants.error),
              ),
              onPressed: () {
                signOutController.signOut();
              },
              icon: const Icon(
                Icons.logout,
                color: ColorConstants.error,
              ),
            );
          },
        ),
      ],
      backgroundColor: ColorConstants.transparent,
      elevation: 0,
    );
  }
}

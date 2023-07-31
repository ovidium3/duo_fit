import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/controllers/user_info/user_profile_options_controller.dart';
import '/constants/color_constants.dart';
import '/helpers/show_delay_mixin.dart';

import 'components/profile_app_bar.dart';

// Page where user can make changes to their information
// ignore: must_be_immutable
class EditProfilePage extends StatelessWidget with ShowDelayMixin {
  EditProfilePage({super.key});

  final UserProfileOptionsController userProfileOptionsController =
      Get.put(UserProfileOptionsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: ProfileAppBar(),
      ),
      backgroundColor: ColorConstants.darkBlue,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              userProfileOptionsController.profileOptionsList.length,
              (i) => DelayedDisplay(
                delay: showDelay(),
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorConstants.overlayBlue,
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: InkWell(
                    onTap: userProfileOptionsController.profileOptionsList[i]
                        ["optionFunction"],
                    child: ListTile(
                      title: Text(
                        userProfileOptionsController.profileOptionsList[i]
                            ["optionTitle"],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: i ==
                                    userProfileOptionsController
                                            .profileOptionsList.length -
                                        1
                                ? ColorConstants.error
                                : Theme.of(context).primaryColor,
                            fontSize: 20),
                      ),
                      leading: Icon(
                        userProfileOptionsController.profileOptionsList[i]
                            ["optionIcon"],
                        color: i ==
                                userProfileOptionsController
                                        .profileOptionsList.length -
                                    1
                            ? ColorConstants.error
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

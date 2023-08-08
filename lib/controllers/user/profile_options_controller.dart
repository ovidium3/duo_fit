import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/app_texts.dart';
import '/constants/text/dialog_texts.dart';
import '/controllers/dialog_controller.dart';
import '/widgets/action_button.dart';
import '/widgets/text_field.dart';

import 'user_info_controller.dart';

// Controller that handles profile change option requests
class ProfileOptionsController extends GetxController {
  // Dependency injections
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  DialogController dialogController = Get.find();

  // Input controllers
  late TextEditingController newUsernameController,
      newEmailController,
      newPasswordController;

  late List profileOptionsList = [
    // Update username
    {
      'optionTitle': TextConstants.changeUsername,
      'optionIcon': Icons.person,
      'optionFunction': () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Username input field
                CustomTextField(
                  label: TextConstants.usernameLabel,
                  controller: newUsernameController,
                  keyboardType: TextInputType.text,
                ),

                // Update button
                SizedBox(
                  height: 50,
                  child: ActionButton(
                    text: TextConstants.update,
                    isOutlined: false,
                    onPressed: () {
                      Get.back();
                      userInformationController
                          .updateUsername(newUsernameController.text.trim());
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: ColorConstants.backgroundColor,
        );
      }
    },
    // Update profile picture
    {
      'optionTitle': TextConstants.changeProfilePicture,
      'optionIcon': Icons.image,
      'optionFunction': () {
        Get.bottomSheet(
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Select image text
                const Text(
                  TextConstants.selectImage,
                  style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 20,
                  ),
                ),

                // Image options
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Photo library option
                    GestureDetector(
                      onTap: () async {
                        await userInformationController.updateProfile(
                            await userInformationController
                                .getImageFromDevice());
                      },
                      child: const Icon(
                        Icons.perm_media,
                        size: 55,
                        color: ColorConstants.primaryColor,
                      ),
                    ),

                    // Camera option
                    GestureDetector(
                      onTap: () async {
                        await userInformationController.updateProfile(
                            await userInformationController
                                .getImageFromCamera());
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        size: 55,
                        color: ColorConstants.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: ColorConstants.backgroundColor,
        );
      },
    },
    // Update email address
    {
      'optionTitle': TextConstants.changeEmailAddress,
      'optionIcon': Icons.mail,
      'optionFunction': () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Email input field
                CustomTextField(
                    label: TextConstants.emailLabel,
                    controller: newEmailController,
                    keyboardType: TextInputType.text),

                // Update button
                SizedBox(
                  height: 50,
                  child: ActionButton(
                    text: TextConstants.update,
                    isOutlined: false,
                    onPressed: () async {
                      Get.back();
                      await userInformationController
                          .updateEmail(newEmailController.text.trim());
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: ColorConstants.backgroundColor,
        );
      }
    },
    // Update password
    {
      'optionTitle': TextConstants.changePassword,
      'optionIcon': Icons.lock,
      'optionFunction': () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Password input field
                CustomTextField(
                    obscureText: true,
                    label: TextConstants.passwordLabel,
                    controller: newPasswordController,
                    keyboardType: TextInputType.visiblePassword),

                // Update button
                SizedBox(
                  height: 50,
                  child: ActionButton(
                    text: TextConstants.update,
                    isOutlined: false,
                    onPressed: () async {
                      Get.back();
                      await userInformationController
                          .updatePassword(newPasswordController.text.trim());
                    },
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: ColorConstants.backgroundColor,
        );
      }
    },
    // Delete account
    {
      'optionTitle': TextConstants.deleteAccount,
      'optionIcon': Icons.delete,
      'optionFunction': () {
        dialogController.showConfirmWithActions(
          DialogTexts.confirmDeleteAccount,
          DialogTexts.delete,
          () {
            Get.back();
            userInformationController.deleteUser();
          },
        );
      }
    },
  ];

  @override
  void onInit() {
    // Input controller creation
    newUsernameController = TextEditingController();
    newPasswordController = TextEditingController();
    newEmailController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // Input controller disposal
    newUsernameController.dispose();
    newPasswordController.dispose();
    newEmailController.dispose();
    super.onClose();
  }
}

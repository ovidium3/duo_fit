import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/controllers/dialog_controller.dart';
import '../../widgets/buttons/auth_button.dart';
import '/widgets/text_field.dart';
import 'user_info_controller.dart';

class UserProfileOptionsController extends GetxController {
  // Dependency injections
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  DialogController dialogController = Get.find();

  // Input controllers
  TextEditingController newUsernameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  late List profileOptionsList = [
    {
      "optionTitle": TextConstants.changeUsername,
      "optionIcon": Icons.person,
      "optionFunction": () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                  label: TextConstants.usernameLabel,
                  controller: newUsernameController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 50,
                  child: AuthButton(
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
    {
      "optionTitle": TextConstants.changeProfilePicture,
      "optionIcon": Icons.image,
      "optionFunction": () {
        Get.bottomSheet(
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  TextConstants.selectImage,
                  style: TextStyle(
                    color: ColorConstants.textWhite,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
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
    {
      "optionTitle": TextConstants.changeEmailAddress,
      "optionIcon": Icons.mail,
      "optionFunction": () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    label: TextConstants.emailLabel,
                    controller: newEmailController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 50,
                  child: AuthButton(
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
    {
      "optionTitle": TextConstants.changePassword,
      "optionIcon": Icons.lock,
      "optionFunction": () {
        Get.bottomSheet(
          Container(
            width: double.infinity,
            height: 200,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextField(
                    obscureText: true,
                    label: TextConstants.passwordLabel,
                    controller: newPasswordController,
                    keyboardType: TextInputType.visiblePassword),
                SizedBox(
                  height: 50,
                  child: AuthButton(
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
    {
      "optionTitle": TextConstants.deleteAccount,
      "optionIcon": Icons.delete,
      "optionFunction": () {
        dialogController.showConfirmWithActions(
          TextConstants.confirmDeleteAccount,
          TextConstants.delete,
          () {
            Get.back();
            userInformationController.deleteUser();
          },
        );
      }
    },
  ];
}

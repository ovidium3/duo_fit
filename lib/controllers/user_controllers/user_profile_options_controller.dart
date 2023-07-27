import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '../../widgets/button_widgets/auth_button.dart';
import '/widgets/text_field.dart';
import '/controllers/dialog_controller.dart';
import 'user_info_controller.dart';

class UserProfileOptionsController extends GetxController {
  UserInformationController userInformationController =
      Get.put(UserInformationController());
  DialogController dialogsAndLoadingController = Get.put(DialogController());

  // Input controllers
  TextEditingController newUserNameController = TextEditingController();
  TextEditingController newEmailController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();

  late List userProfileOptionsList = [
    {
      "optionTitle": "change username",
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
                    label: "new username",
                    controller: newUserNameController,
                    keyboardType: TextInputType.text),
                SizedBox(
                  height: 50,
                  child: AuthButton(
                      text: "update",
                      isOutlined: false,
                      onPressed: () {
                        Get.back();
                        userInformationController
                            .updateUsername(newUserNameController.text.trim());
                      }),
                ),
              ],
            ),
          ),
          backgroundColor: ColorConstants.darkBlue,
        );
      }
    },
    {
      "optionTitle": "change profile photo",
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
                    "Select an image",
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
                                  .getImgFromDevice());
                        },
                        child: const Icon(
                          Icons.perm_media,
                          size: 55,
                          color: ColorConstants.green,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await userInformationController.updateProfile(
                              await userInformationController
                                  .getImgFromCamera());
                        },
                        child: const Icon(
                          Icons.camera_alt,
                          size: 55,
                          color: ColorConstants.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            backgroundColor: ColorConstants.darkBlue);
      },
    },
    {
      "optionTitle": "set a new email adress",
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
                      label: "new email",
                      controller: newEmailController,
                      keyboardType: TextInputType.text),
                  SizedBox(
                    height: 50,
                    child: AuthButton(
                        text: "update",
                        isOutlined: false,
                        onPressed: () async {
                          Get.back();

                          await userInformationController
                              .updateEmail(newEmailController.text.trim());
                        }),
                  )
                ],
              ),
            ),
            backgroundColor: ColorConstants.darkBlue);
      }
    },
    {
      "optionTitle": "set a new password",
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
                      label: "new password",
                      controller: newPasswordController,
                      keyboardType: TextInputType.visiblePassword),
                  SizedBox(
                    height: 50,
                    child: AuthButton(
                        text: "update",
                        isOutlined: false,
                        onPressed: () async {
                          Get.back();
                          await userInformationController.updatePassword(
                              newPasswordController.text.trim());
                        }),
                  )
                ],
              ),
            ),
            backgroundColor: ColorConstants.darkBlue);
      }
    },
    {
      "optionTitle": "Delete user",
      "optionIcon": Icons.delete,
      "optionFunction": () {
        dialogsAndLoadingController.showConfirmWithActions(
          "are you sure you want to delete your account ?",
          "delete",
          () {
            Get.back();
            userInformationController.deleteUser();
          },
        );
      }
    },
  ];
}

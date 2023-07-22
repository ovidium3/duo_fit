import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/controllers/functionsController.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';

import '../../../../controllers/authControllers/signOutController.dart';
import '../../../../helpers/string_methods.dart';

class ProfileAppBar extends StatelessWidget {
  ProfileAppBar({super.key});
  final FunctionsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        capitalize(TextConstants.profile),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
        ),
      ),
      toolbarHeight: 80,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        GetBuilder<SignOutController>(
            init: SignOutController(),
            builder: (signOutController) {
              return ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkBlue, elevation: 0),
                label: Text(
                  capitalize(TextConstants.logOut),
                  style: const TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  signOutController.signOut();
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                ),
              );
            }),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

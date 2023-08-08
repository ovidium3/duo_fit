import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/data/general_data.dart';
import '/constants/text/app_texts.dart';
import '/controllers/auth/sign_out_controller.dart';
import '/controllers/user/user_info_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '/widgets/action_button.dart';

import 'components/profile_app_bar.dart';
import 'components/stat.dart';
import 'edit_profile_page.dart';

// Page where users can view their profile and achievements
class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with ShowDelayMixin {
  // Dependency injections
  final UserInformationController userInformationController = Get.find();
  final SignOutController signOutController = Get.put(SignOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.backgroundColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: DelayedDisplay(
          delay: showDelay(),
          child: const ProfileAppBar(),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 1),
            Column(
              children: [
                // Profile picture
                DelayedDisplay(
                  delay: showDelay(),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Obx(
                        (() => Image(
                              image: NetworkImage(userInformationController
                                  .userProfileImage.value),
                              fit: BoxFit.cover,
                              frameBuilder: (_, image, loadingBuilder, __) {
                                if (loadingBuilder == null) {
                                  return const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: SpinKitSpinningLines(
                                        color: ColorConstants.primaryColor,
                                        duration: Duration(seconds: 1),
                                        size: 60,
                                      ),
                                    ),
                                  );
                                }
                                return image;
                              },
                            )),
                      ),
                    ),
                  ),
                ),

                // Space between profile picture and username
                const SizedBox(height: 20),

                // Username
                DelayedDisplay(
                  delay: showDelay(),
                  child: Obx(
                    () => DelayedDisplay(
                      child: Text(
                        userInformationController.username.value,
                        style: const TextStyle(
                          color: ColorConstants.textWhite,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

                // Space between username and profile description
                const SizedBox(height: 20),

                // Profile description
                DelayedDisplay(
                  delay: showDelay(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      TextConstants.profileDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: ColorConstants.textWhite.withOpacity(.8),
                      ),
                    ),
                  ),
                ),

                // Space between profile description and user statistics
                const SizedBox(height: 40),

                // User statistics
                Obx(
                  () => DelayedDisplay(
                    delay: showDelay(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ...List.generate(
                          DataConstants.profileStatTitles.length,
                          (i) => UserStatistic(
                            statTitle: DataConstants.profileStatTitles[i],
                            statValue: userInformationController
                                .userProfileStats
                                .toList()[i]
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Space between user statistics and edit profile button
            const Spacer(flex: 2),
            DelayedDisplay(
              delay: showDelay(),
              child: ActionButton(
                text: TextConstants.editProfile,
                isOutlined: true,
                onPressed: () {
                  Get.to(EditProfilePage());
                },
              ),
            ),

            // Padding below edit profile button
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

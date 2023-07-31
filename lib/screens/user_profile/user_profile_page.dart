import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/constants/user_profile_stats.dart';
import '/controllers/auth/sign_out_controller.dart';
import '/controllers/user_info/user_info_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '../../widgets/buttons/auth_button.dart';

import 'components/profile_app_bar.dart';
import 'components/stat.dart';
import 'edit_profile_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> with ShowDelayMixin {
  // Dependency injections
  final UserInformationController userInformationController = Get.find();
  final SignOutController signOutController = Get.put(SignOutController());

  //final bool hasProfilePic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.darkBlue,
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
                              // : NetworkImage(MediaConstants.defaultProfile),
                              fit: BoxFit.cover,
                              frameBuilder: (_, image, loadingBuilder, __) {
                                if (loadingBuilder == null) {
                                  return const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: SpinKitSpinningLines(
                                        color: ColorConstants.green,
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
                DelayedDisplay(
                  delay: showDelay(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        UserProfileStats.stats.length,
                        (i) => UserStatistic(
                          statValue: (UserProfileStats.stats[i]["value"]),
                          statTitle: UserProfileStats.stats[i]["title"],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(flex: 2),
            DelayedDisplay(
              delay: showDelay(),
              child: AuthButton(
                text: TextConstants.editProfile,
                isOutlined: true,
                onPressed: () {
                  Get.to(EditProfilePage());
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

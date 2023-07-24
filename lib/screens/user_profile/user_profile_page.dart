import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';
import 'package:duo_fit/widgets/button_widgets/button.dart';
import '../../controllers/auth_controllers/sign_out_controller.dart';
import '../../controllers/user_controllers/user_info_controller.dart';
import '../../constants/user_profile_stats.dart';
import '../../helpers/string_methods.dart';
import 'components/profile_app_bar.dart';
import 'components/stat.dart';
import 'edit_profile_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final UserInformationController userInformationController = Get.find();
  final SignOutController signOutController = Get.put(SignOutController());
  Color? scfldColor = ColorConstants.darkBlue;
  Color? overlayedColor = const Color.fromARGB(255, 22, 23, 43);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scfldColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: DelayedDisplay(
          delay: Duration(milliseconds: delay),
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
                  delay: Duration(milliseconds: delay + 100),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: Obx(
                        (() => Image(
                              image: NetworkImage(userInformationController
                                  .userProfileImg.value),
                              fit: BoxFit.cover,
                              frameBuilder: (_, image, loadingBuilder, __) {
                                if (loadingBuilder == null) {
                                  return const SizedBox(
                                    height: 300,
                                    child: Center(
                                      child: SpinKitSpinningLines(
                                        color: Color(0xff40D876),
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
                const SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 400),
                  child: Obx(
                    () => DelayedDisplay(
                      child: Text(
                        capitalize(
                          userInformationController.username.value,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 300),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      "this take the place of description, it's not implemented yet like the row below, it's desactivated for now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white.withOpacity(.8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 400),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...List.generate(
                        UserProfileStats.stats.length,
                        (i) => Stat(
                          statValue:
                              capitalize(UserProfileStats.stats[i]["value"]),
                          statTitle: capitalize(
                            UserProfileStats.stats[i]["title"],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            DelayedDisplay(
              delay: Duration(milliseconds: delay + 500),
              child: CustomButton(
                  text: capitalize(TextConstants.configureSettings),
                  isOutlined: true,
                  onPressed: () {
                    Get.to(() => CustomProfileSettings(), arguments: [
                      scfldColor,
                      overlayedColor,
                    ]);
                  }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/text_constants/general_text_constants.dart';
import 'package:duo_fit/constants/workouts%20lists/workouts%20Lists.dart';
import 'package:duo_fit/screens/user_profile/user_profile_page.dart';

import '../../controllers/tabs_controllers/workout_tab_controller.dart';
import '../../controllers/user_controllers/user_info_controller.dart';
import '../../constants/image_path_constants.dart';
import '../../helpers/string_methods.dart';
import '../../widgets/background_image.dart';
import 'componenets/find_your_workout.dart';
import 'componenets/tab_bar_workout_view.dart';
import 'componenets/username_and_profile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final String bgImg = ImgSrc().randomFromAssetsList();
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserInformationController userInformationController =
      Get.put(UserInformationController());

  final CustomTabBarController _tabx = Get.put(CustomTabBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        BackgroundImage(
          backgroundImage: widget.bgImg,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.45, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorConstants.darkBlue,
                ColorConstants.darkBlue.withOpacity(0.05),
              ],
            ),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Obx(
                      () => ProfileAndUsername(
                        onProfileImgTap: () {
                          Get.to(() => const UserProfile());
                        },
                        username: userInformationController.username.value,
                        profileImg:
                            userInformationController.userProfileImg.value,
                      ),
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    //const CalorieCircle();
                    const SizedBox(
                      height: 55,
                    ),
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 200),
                      child: const FindYourWorkout(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 40,
                      child: DelayedDisplay(
                        delay: Duration(
                          milliseconds: delay + 400,
                        ),
                        child: TabBar(
                          labelColor: Colors.white,
                          isScrollable: true,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          controller: _tabx.workOutTabController,
                          tabs: _tabx.workOutTabs,
                        ),
                      ),
                    ),
                    Expanded(
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: delay + 600),
                        child: TabBarView(
                          controller: _tabx.workOutTabController,
                          children: [
                            Center(
                              child: TabBarViewSection(
                                title: capitalize(
                                  'All workouts',
                                ),
                                dataList: WorkoutsList.allWorkoutsList,
                              ),
                            ),
                            Center(
                              child: TabBarViewSection(
                                title: capitalize(
                                  'Popular',
                                ),
                                dataList: WorkoutsList.popularWorkoutsList,
                              ),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: capitalize(
                                    'hard',
                                  ),
                                  dataList: WorkoutsList.hardWorkoutsList),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: capitalize(
                                    'Full body',
                                  ),
                                  dataList: WorkoutsList.fullBodyWorkoutsList),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: capitalize(
                                    'Crossfit',
                                  ),
                                  dataList: WorkoutsList.crossFit),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

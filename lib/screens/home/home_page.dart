import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:duo_fit/constants/color_constants.dart';
import 'package:duo_fit/constants/text/general_texts.dart';
import 'package:duo_fit/constants/data/workout_data.dart';
import 'package:duo_fit/screens/user_profile/user_profile_page.dart';

import '../../controllers/tabs_controllers/workout_tab_controller.dart';
import '../../controllers/user_controllers/user_info_controller.dart';
import '../../constants/media_constants.dart';
import '../../helpers/string_methods.dart';
import '../../widgets/background_image.dart';
import 'components/find_your_workout.dart';
import 'components/tab_bar_workout_view.dart';
import 'components/username_and_profile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final String bgImg = MediaConstants().randomFromAssetsList();
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
        const BackgroundImage(),
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
                    const SizedBox(height: 50),
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
                    const SizedBox(height: 55),
                    //const CalorieCircle();
                    const SizedBox(height: 55),
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 200),
                      child: const FindYourWorkout(),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 40,
                      child: DelayedDisplay(
                        delay: Duration(
                          milliseconds: delay + 400,
                        ),
                        child: TabBar(
                          labelColor: ColorConstants.tabBar,
                          isScrollable: true,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                          ),
                          controller: _tabx.workOutTabController,
                          tabs: _tabx.workoutTabs,
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
                                title: 'Popular Workouts',
                                dataList: [
                                  WorkoutData.push,
                                  WorkoutData.pull,
                                  WorkoutData.legs
                                ],
                              ),
                            ),
                            Center(
                              child: TabBarViewSection(
                                title: 'Upper Body Workouts',
                                dataList: [
                                  WorkoutData.upperBody,
                                  WorkoutData.push,
                                  WorkoutData.pull
                                ],
                              ),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: 'Lower Body Workouts',
                                  dataList: [WorkoutData.legs]),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: 'Full Body Workouts',
                                  dataList: [WorkoutData.fullBody]),
                            ),
                            Center(
                              child: TabBarViewSection(
                                  title: 'Extras',
                                  dataList: [
                                    WorkoutData.arms,
                                    WorkoutData.abs,
                                    WorkoutData.shoulders
                                  ]),
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

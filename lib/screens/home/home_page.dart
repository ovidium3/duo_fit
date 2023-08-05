import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/data/general_data.dart';
import '/controllers/tabs/workout_tab_controller.dart';
import '/controllers/user_info/user_info_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '/screens/user_profile/user_profile_page.dart';
import '/widgets/background_image.dart';

import 'components/calorie_log.dart';
import 'components/find_your_workout.dart';
import 'components/workout_tab_bar.dart';
import 'components/profile_and_username.dart';

// Page that serves as the main hub for user
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ShowDelayMixin {
  // Dependency injections
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
                  ColorConstants.backgroundColor,
                  ColorConstants.backgroundColor.withOpacity(0.05),
                ],
              ),
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 2,
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Space above hey / name
                      const SizedBox(height: 50),

                      // Username / profile picture
                      Obx(
                        () => ProfileAndUsername(
                          onProfileImageTap: () {
                            Get.to(() => const UserProfile());
                          },
                          username: userInformationController.username.value,
                          profileImage:
                              userInformationController.userProfileImage.value,
                        ),
                      ),

                      // Calorie log
                      DelayedDisplay(
                        delay: showDelay(),
                        child: CalorieLog(),
                      ),

                      // Space between calorie circle and find your workout
                      const SizedBox(height: 50),

                      // Find your workout
                      DelayedDisplay(
                        delay: showDelay(),
                        child: const FindYourWorkout(),
                      ),

                      // Space between find your workout and workout tab bar
                      const SizedBox(height: 15),

                      // Workout tab bar sections
                      SizedBox(
                        height: 40,
                        child: DelayedDisplay(
                          delay: showDelay(),
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
                            controller: _tabx.workoutTabController,
                            tabs: DataConstants.workoutTabs,
                          ),
                        ),
                      ),

                      // Workout cards
                      Expanded(
                        child: DelayedDisplay(
                          delay: showDelay(),
                          child: TabBarView(
                            controller: _tabx.workoutTabController,
                            children: [
                              Center(
                                child: WorkoutTabBar(
                                  title: 'Popular Workouts',
                                  workoutList: DataConstants.popularWorkouts,
                                ),
                              ),
                              Center(
                                child: WorkoutTabBar(
                                  title: 'Upper Body Workouts',
                                  workoutList: DataConstants.upperBodyWorkouts,
                                ),
                              ),
                              Center(
                                child: WorkoutTabBar(
                                  title: 'Lower Body Workouts',
                                  workoutList: DataConstants.lowerBodyWorkouts,
                                ),
                              ),
                              Center(
                                child: WorkoutTabBar(
                                  title: 'Full Body Workouts',
                                  workoutList: DataConstants.fullBodyWorkouts,
                                ),
                              ),
                              Center(
                                child: WorkoutTabBar(
                                  title: 'Extra',
                                  workoutList: DataConstants.extraWorkouts,
                                ),
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
      ),
    );
  }
}

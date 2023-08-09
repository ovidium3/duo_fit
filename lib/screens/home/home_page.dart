import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/data/general_data.dart';
import '/constants/text/app_texts.dart';
import '/controllers/workout_tab_controller.dart';
import '/controllers/user/user_info_controller.dart';
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
  final WorkoutTabController _tabx = Get.put(WorkoutTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                stops: const [0.65, 1],
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
                  maxHeight: MediaQuery.of(context).size.height * 1.3,
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

                      // Space between calorie log and find your workout
                      const SizedBox(height: 30),

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
                              // Popular workouts tab
                              Center(
                                child: WorkoutTabBar(
                                  title: TextConstants.workoutsTab1,
                                  workoutList: DataConstants.popularWorkouts,
                                ),
                              ),

                              // Minimalist workouts tab
                              Center(
                                child: WorkoutTabBar(
                                  title: TextConstants.workoutsTab2,
                                  workoutList: DataConstants.minimalistWorkouts,
                                ),
                              ),

                              // Essential workouts tab
                              Center(
                                child: WorkoutTabBar(
                                  title: TextConstants.workoutsTab3,
                                  workoutList: DataConstants.essentialWorkouts,
                                ),
                              ),

                              // Extra workouts tab
                              Center(
                                child: WorkoutTabBar(
                                  title: TextConstants.workoutsTab4,
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

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/tabs_controllers/workout_details_controller.dart';
import '../../constants/color_constants.dart';
import '../../constants/text/general_texts.dart';

import '../../helpers/string_methods.dart';
import '../../widgets/button_widgets/action_button.dart';
import 'components/rating_stars.dart';
import '../../widgets/button_widgets/auth_button.dart';

class WorkoutDetailsPage extends StatelessWidget {
  WorkoutDetailsPage({
    required this.overlayedImg,
    required this.workoutTitle,
    required this.timeLeftInHour,
    required this.movesNumber,
    required this.durationInMinutes,
    required this.setsNumber,
    //required this.rating,
    required this.description,
    //required this.reviews,
    //required this.priceInDollars,
    //required this.hasFreeTrial,
    //required this.comments,
    super.key,
  });
  String overlayedImg,
      workoutTitle,
      setsNumber,
      timeLeftInHour,
      movesNumber,
      //comments,
      durationInMinutes,
      //rating,
      description;
  //reviews,
  //priceInDollars,
  //hasFreeTrial;
  final DetailsTabController _tabx = Get.put(DetailsTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FractionallySizedBox(
          heightFactor: .7,
          child: SizedBox(
            width: double.infinity,
            child: Image.asset(
              overlayedImg,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              stops: const [0.5, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                ColorConstants.darkBlue,
                overlayedImg != null
                    ? ColorConstants.darkBlue.withOpacity(0.05)
                    : ColorConstants.darkBlue.withOpacity(0.8),
              ],
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        width: 120,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: ColorConstants.iconWhite,
                              size: 16,
                            ),
                            Text(
                              "$timeLeftInHour ${TextConstants.hours}",
                              style: const TextStyle(
                                color: ColorConstants.textWhite,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ActionButton(
                        onTap: () {
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Center(
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: delay + 200),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorConstants.inputDecor.withOpacity(.4),
                          width: .5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: movesNumber,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                              children: const [
                                TextSpan(
                                  text: " ${TextConstants.moves}",
                                  style: TextStyle(
                                    color: ColorConstants.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: setsNumber,
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                              children: const [
                                TextSpan(
                                  text: " ${TextConstants.sets}",
                                  style: TextStyle(
                                    color: ColorConstants.textWhite,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                                text: durationInMinutes,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: const [
                                  TextSpan(
                                    text: " ${TextConstants.minutes}",
                                    style: TextStyle(
                                      color: ColorConstants.textWhite,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 300),
                  child: Text(
                    workoutTitle,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textWhite,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 400),
                  child: RatingStars(
                    starsNumber: 5,
                    filledStars: 0,
                  ),
                ),
                const SizedBox(height: 30),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 500),
                  child: SizedBox(
                    height: 30,
                    child: TabBar(
                      unselectedLabelColor:
                          ColorConstants.tabBar.withOpacity(.5),
                      indicator: const BoxDecoration(
                        color: ColorConstants.transparent,
                      ),
                      labelColor: ColorConstants.tabBar,
                      controller: _tabx.detailsTabController,
                      tabs: _tabx.detailsTabs,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: DelayedDisplay(
                    delay: Duration(milliseconds: delay + 600),
                    child: TabBarView(
                      controller: _tabx.detailsTabController,
                      children: [
                        Center(
                          child: Text(
                            description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: ColorConstants.textWhite,
                            ),
                          ),
                        ),
                        // Center(
                        //   child: Text(
                        //     reviews,
                        //     textAlign: TextAlign.center,
                        //     style: const TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                        // Center(
                        //   child: Text(
                        //     comments,
                        //     textAlign: TextAlign.center,
                        //     style: const TextStyle(
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 700),
                      child: AuthButton(
                        onPressed: () {},
                        isRounded: false,
                        text: ("\$ 999"),
                        isOutlined: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 800),
                      child: AuthButton(
                        onPressed: () {},
                        isRounded: false,
                        text: TextConstants.noFreeTrialAvailable,
                        isOutlined: true,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

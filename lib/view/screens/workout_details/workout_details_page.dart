import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/tabs_controllers/workout_details_controller.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/text_constants/general_text_constants.dart';

import '../../../helpers/string_methods.dart';
import '../../widgets/action_button.dart';
import 'componenets/RatingStars.dart';
import '../../widgets/button.dart';

class WorkoutDetailsPage extends StatelessWidget {
  WorkoutDetailsPage({
    required this.overlayedImg,
    required this.workOutTitle,
    required this.timeLeftInHour,
    required this.movesNumber,
    required this.durationInMinutes,
    required this.setsNumber,
    required this.rating,
    required this.description,
    required this.reviews,
    required this.priceInDollars,
    required this.hasFreeTrial,
    required this.comments,
    super.key,
  });
  String overlayedImg,
      workOutTitle,
      setsNumber,
      timeLeftInHour,
      movesNumber,
      comments,
      durationInMinutes,
      rating,
      description,
      reviews,
      priceInDollars,
      hasFreeTrial;
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
                const SizedBox(
                  height: 40,
                ),
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
                              color: Colors.white,
                              size: 16,
                            ),
                            Text(
                              "$timeLeftInHour ${TextConstants.hours}",
                              style: const TextStyle(color: Colors.white),
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
                          color: Colors.white.withOpacity(.4),
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
                                children: [
                                  TextSpan(
                                    text: " ${TextConstants.moves}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: setsNumber,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${TextConstants.sets}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: durationInMinutes,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${TextConstants.minutes}",
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 300),
                  child: Text(
                    capitalize(workOutTitle),
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 400),
                  child: RatingStars(
                    starsNumber: 5,
                    filledStars: int.parse(rating != null ? rating : "0"),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: delay + 500),
                  child: SizedBox(
                    height: 30,
                    child: TabBar(
                      unselectedLabelColor: Colors.white.withOpacity(.5),
                      indicator: const BoxDecoration(color: Colors.transparent),
                      labelColor: Colors.white,
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
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            reviews,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            comments,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 700),
                      child: CustomButton(
                        onPressed: () {},
                        isRounded: false,
                        text: capitalize("\$ $priceInDollars"),
                        isOutlined: false,
                      ),
                    ),
                    const SizedBox(height: 10),
                    DelayedDisplay(
                      delay: Duration(milliseconds: delay + 800),
                      child: CustomButton(
                        onPressed: () {},
                        isRounded: false,
                        text: hasFreeTrial.toLowerCase() == "true"
                            ? capitalize(TextConstants.freeTrial)
                            : capitalize(TextConstants.noFreeTrialAvailable),
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

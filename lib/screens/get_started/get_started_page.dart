import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '/constants/text/general_texts.dart';
import '/constants/data/general_data.dart';
import '/controllers/get_started/get_started_controller.dart';
import '/helpers/show_delay_mixin.dart';
import '/widgets/background_image.dart';
import '../../widgets/text/app_title.dart';
import '../../widgets/text/title_with_description.dart';

import 'components/goal_cards_scroll_view.dart';

// Page where user can select their goals from a list of cards
// ignore: must_be_immutable
class GetStartedPage extends GetView<GetStartedController> with ShowDelayMixin {
  GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const BackgroundImage(),
          Container(
            color: ColorConstants.darkBlue.withOpacity(0.69),
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Space above app title
                  const Spacer(),

                  // App title
                  DelayedDisplay(
                    delay: showDelay(),
                    child: const AppTitle(),
                  ),

                  // Space between app title and your goal / goal description
                  const Spacer(flex: 2),

                  // Your goal / goal description
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: DelayedDisplay(
                      delay: showDelay(),
                      child: const TitleWithDescription(
                        title: TextConstants.getStartedTitle,
                        description: TextConstants.getStartedDescription,
                      ),
                    ),
                  ),

                  // Space between your goal / goal description and goal cards
                  const Spacer(),

                  // Goal cards
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: ColorConstants.transparent,
                            secondary: ColorConstants.transparent,
                          ),
                    ),
                    child: GoalCardsScrollView(delay: showDelay()),
                  ),

                  // Space between goal cards and cards tapped / next button
                  const SizedBox(height: 20),

                  // Cards tapped / next button
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: DelayedDisplay(
                      delay: showDelay(),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Align(
                                alignment: Alignment.center,
                                child: GetBuilder<GetStartedController>(
                                  id: controller.rebuildId,
                                  builder: (controller) {
                                    return Text(
                                      '${controller.checkedCardsIds.length} / ${DataConstants.goalCardsList.length}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ColorConstants.green,
                                        fontSize: 12,
                                      ),
                                    );
                                  },
                                )),
                            const SizedBox(width: 15),
                            GetBuilder<GetStartedController>(
                              id: controller.rebuildId,
                              builder: (controller) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                  ),
                                  onPressed: controller.anyCardTapped
                                      ? () {
                                          Get.toNamed("/signUp");
                                        }
                                      : null,
                                  child: const Text(
                                    (TextConstants.next),
                                    style: TextStyle(
                                      color: ColorConstants.textWhite,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/constants/color_constants.dart';
import '../../constants/text/general_texts.dart';
import '/widgets/background_image.dart';
import '../../constants/data/general_data.dart';
import '/constants/show_delay_mixin.dart';
import '/controllers/get_started_controllers/get_started_controller.dart';
import '../../widgets/text_widgets/app_title.dart';
import '/widgets/text_widgets/title_with_description.dart';
import 'componenets/get_started_cards_scroll_view.dart';
import '/controllers/dialog_controller.dart';

class GetStartedPage extends GetView<GetStartedController>
    with DelayHelperMixin {
  GetStartedPage({super.key});

  //final DialogController dialogController = Get.put(DialogController());

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
              margin: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(),
                  DelayedDisplay(
                    delay: getDelayDuration(),
                    child: const AppTitle(),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: DelayedDisplay(
                      delay: getDelayDuration(),
                      child: const TitleWithDescription(
                        title: TextConstants.getStartedTitle,
                        description: TextConstants.getStartedDescription,
                      ),
                    ),
                  ),
                  const Spacer(flex: 2),
                  Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: Theme.of(context).colorScheme.copyWith(
                            primary: Colors.transparent,
                            secondary: Colors.transparent,
                          ),
                    ),
                    child: GetStartedCardsScrollView(
                      delay: getDelayDuration(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: DelayedDisplay(
                      delay: getDelayDuration(),
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
                                      "${controller.checkedCardsIds.length} / ${handledCardsList.length}",
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
                                  onPressed:
                                      controller.hasUserChooserAtLeastOneChoice
                                          ? () {
                                              Get.toNamed("/signUp");
                                            }
                                          : null,
                                  //: dialogController.showError('error'),
                                  child: const Text(
                                    (TextConstants.next),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        //),
                        //],
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
